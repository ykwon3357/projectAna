package com.ana.service;

import static org.junit.Assert.assertNotNull;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.BookingVO;
import com.ana.domain.RomVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookingServiceTests {
	
	@Setter(onMethod_= {@Autowired})
	private BookingService service;
	
	//@Test
	public void testDelete() {
		
		log.info("REMOVE RESULT: "+ service.remove("B14"));
		
	}
	
	//@Test
	public void testUpdate() {
		BookingVO board = service.get("B8");
		if(board == null) {
			return;
		}
		
		board.setRequest("요청사항 수정합니다.");
		log.info("MODIFY RESULT: " + service.modify(board));
		
		
	}
	
	
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
//	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board-> log.info(board));
//	}
//	
//	
//	@Test
//	public void testGet() {
//		log.info(service.get("B1"));
//	}
	
	
	@Test
	public void testRegister() {
		BookingVO book = new BookingVO();
		book.setUserNum("U999");
		book.setRomNum("R999");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			book.setCheckinDate(beforeFormat.parse("2020/8/1"));
			book.setCheckoutDate(beforeFormat.parse("2020/8/3"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		book.setStaydays(2);
		book.setGuest(2);
		book.setBookPrice(1004);
		book.setExpectedArr("PM02");
		book.setSmoking("1");
		book.setRequest("뷰 좋은 방 주세요");
		service.register(book);
		log.info("생성된 예약 번호: " + book.getBookNum());
	}

}
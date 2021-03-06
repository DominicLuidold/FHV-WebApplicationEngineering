/*
 * Dominic Luidold
 *
 * @license https://github.com/DominicLuidold/FHV-WebApplicationEngineering/blob/master/LICENSE (MIT License)
 */
package at.fhv.dlu9576.guestbook.jdbc;

import at.fhv.dlu9576.guestbook.bean.RatingBean;
import at.fhv.dlu9576.guestbook.jdbc.broker.*;
import at.fhv.dlu9576.guestbook.jdbc.model.*;

import java.util.List;

public class JDBCDatabaseFacade {

    public static boolean loginUser(String userId, String password) {
        return new UserBroker().login(userId, password);
    }

    public static List<GuestbookEntry> getAllGuestbookEntries() {
        return new GuestbookEntryBroker().getAll();
    }

    public static List<RatingBean> getAllRatings() {
        return new RatingBroker().getAll();
    }

    public static List<Book> getAllBooks() {
        return new BookBroker().getAll();
    }

    public static List<Audio> getAllAudio() {
        return new AudioBroker().getAll();
    }

    public static <T> boolean checkIfExists(T item) {
        if (item instanceof User) {
            return new UserBroker().checkIfExists((User) item);
        }
        return true;
    }

    public static <T> void save(T item) {
        if (item instanceof GuestbookEntry) {
            new GuestbookEntryBroker().save((GuestbookEntry) item);
        } else if (item instanceof User) {
            new UserBroker().save((User) item);
        } else if (item instanceof RatingBean) {
            new RatingBroker().save((RatingBean) item);
        }
    }
}

From: Fabiano Pallonetto <fp.soft@tiscali.it>
Date: Fri, 16 Jan 2004 14:06:53 +0000
Subject: [Kernel-janitors] Project TO DO
Message-Id: <1074262013.3613.40.camel@Michelangelo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi, I'm a student of Computer Science and I've to develop a little
project  in OS. I thought to do this:

" From: Matthew Wilcox
Subject: Calling yield() Considered Harmful

In 2.6, the semantics of calling yield() changed from "sleep for a
bit" to "I really don't want to run for a while".  This matches POSIX
better, but there's a lot of drivers still using yield() when they mean
cond_resched(), schedule() or even schedule_timeout().

Here's a list:

$ find drivers/ -type f |xargs grep 'yield[^a-z]*('
drivers/cdrom/cdu31a.c:         yield();
drivers/cdrom/sonycd535.c:              yield();
drivers/macintosh/adb.c:                        yield();
drivers/message/i2o/i2o_core.c:         yield();
drivers/message/i2o/i2o_core.c:         yield();
drivers/mtd/chips/cfi_cmdset_0002.c:                    yield();
drivers/mtd/nand/nand.c:                yield ();
drivers/net/depca.c:                    yield();
drivers/net/sb1000.c:           yield();
drivers/net/sb1000.c:           yield();
drivers/net/sis900.c:                   yield();
drivers/net/e100/e100_eeprom.c:                 yield();
drivers/net/e100/e100_eeprom.c:                 yield();
drivers/net/e100/e100_main.c:                   yield();
drivers/net/e100/e100_phy.c:                    yield();
drivers/net/e100/e100_phy.c:                            yield();
drivers/net/e100/e100_test.c:                   yield();
drivers/scsi/NCR5380.c:                 yield();
drivers/scsi/ibmmca.c:          yield();
drivers/scsi/ibmmca.c:          yield();
drivers/scsi/megaraid.c:                udelay(100); yield();
drivers/usb/core/message.c:                     yield ();

As always, this isn't a search-and-replace type of job.  Let's take
the first one as an example:

static inline void sony_sleep(void)
{
        unsigned long flags;

        if (cdu31a_irq <= 0) {
                yield();
        } else {                /* Interrupt driven */
                save_flags(flags);
                cli();
                enable_interrupts();
                interruptible_sleep_on(&cdu31a_irq_wait);
                restore_flags(flags);
        }
}

If you look at how sony_sleep() is typically used, what you really want to
do is schedule_timeout(1).  But someone needs to look at all these cases..
do I hear a volunteer?"

Has anyone smenthing intersting to suggest me? You know, I'm a newbie 
than I cannot  face a too big one, especially in one semester.
Thank you very much!

-- 
Fabiano Pallonetto <fp.soft@tiscali.it>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

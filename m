From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 21 Jan 2012 19:04:31 +0000
Subject: Re: busy loops in kernel
Message-Id: <alpine.DEB.2.02.1201211930320.2002@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
In-Reply-To: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I looked at this one:

ticks 2  Infinite Loop:228  Infinite Loop:600    CC [M] 
drivers/i2c/busses/i2c-xiic.o

Line 200 looks like what you described in your previous message.  I don't 
understand the problem in line 600, though:

         while ((fifo_space >= 2) && (first || (i2c->nmsgs > 1))) {
                 if (!first) {
                         i2c->nmsgs--;
                         i2c->tx_msg++;
                         i2c->tx_pos = 0;
                 } else
                         first = 0;

                 if (i2c->tx_msg->flags & I2C_M_RD) {
                         /* we dont date putting several reads in the FIFO 
*/
                         xiic_start_recv(i2c);
                         return;
                 } else {
                         xiic_start_send(i2c);
                         if (xiic_tx_space(i2c) != 0) {
                                 /* the message could not be completely 
sent */
                                 break;
                         }
                 }

 		fifo_space = xiic_tx_fifo_space(i2c);
         }

It looks like on every iteration execpt the first one, i2c->nmsgs is 
decremented, so it will not long be greater than one.

The next two rely on kernel timing mechansims:

ticks 1  Infinite Loop:284    CC [M]  drivers/i2c/busses/i2c-eg20t.o
    while (ktime_lt(ktime_get(), ns_val))
ticks 1  Infinite Loop:84    CC [M]  drivers/i2c/busses/i2c-pca-isa.o
    ret = time_before(jiffies, timeout); ... while (ret)

Are these timing mechanisms unsafe?

In this case:

ticks 1  Infinite Loop:338    CC [M]  drivers/infiniband/hw/amso1100/c2.o

it looks like it is actually the outer loop, starting on line 336, that is 
unsafe.

For this one:

ticks 1  Infinite Loop:47    CC [M]  drivers/infiniband/hw/amso1100/c2_intr.o

I am not completely sure to understand the code.  c2dev->hints_read is 
nonlocal and is never explicitly reset to 0.  Perhaps this code is only 
executed once per instance of cdev.  In any case hints_read is incremented 
on each iteration.  But perhaps the value of 
be16_to_cpu(*c2dev->hint_count) can also change at each access?

This is clearly the sort of loop you described:

ticks 1  Infinite Loop:735    CC [M]  drivers/infiniband/hw/amso1100/c2_qp.o

Skipping ahead a bit, I don't at all see the problem in the following 
code:

ticks 1  Infinite Loop:184    CC [M]  drivers/media/video/ivtv/ivtv-firmware.o

         for (i = 0; i < size; i += 0x100) {
 		if (readl(mem + i)      = 0x12345678 &&
                     readl(mem + i + 4)  = 0x34567812 &&
                     readl(mem + i + 8)  = 0x56781234 &&
                     readl(mem + i + 12) = 0x78123456) {
                         return (volatile struct ivtv_mailbox __iomem *)(mem + i + 16);
                 }
         }

I don't see the problem here either:

ticks 1  Infinite Loop:93    CC [M]  drivers/media/video/pvrusb2/pvrusb2-eeprom.o

         for (tcnt = 0; tcnt < EEPROM_SIZE; tcnt += pcnt) {
                 pcnt = 16;
                 if (pcnt + tcnt > EEPROM_SIZE) pcnt = EEPROM_SIZE-tcnt;
 		...
 	}

The next report is on similar code:

ticks 1  Infinite Loop:3536    CC [M]  drivers/media/video/pvrusb2/pvrusb2-hdw.o

These two indeed might be dangerous:

ticks 2  Infinite Loop:481  Infinite Loop:676    CC [M]  drivers/media/video/saa7134/saa7134-tvaudio.o

julia

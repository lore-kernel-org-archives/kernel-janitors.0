From: Michael Veeck <michael.veeck@gmx.net>
Date: Wed, 21 Apr 2004 23:31:46 +0000
Subject: [Kernel-janitors] Re: [janitor] use kernel min/max (2/2)
Message-Id: <40870462.5070807@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4695877104976266=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040316163520.048ce536.rddunlap@osdl.org>	<200403181817.59173.bzolnier@elka.pw.edu.pl> <20040421144605.517d5834.rddunlap@osdl.org>
In-Reply-To: <20040421144605.517d5834.rddunlap@osdl.org>
To: "Randy.Dunlap" <rddunlap@osdl.org>
Cc: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>, linux-ide@vger.kernel.org, Kernel-janitors@lists.osdl.org

--===============4695877104976266==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Randy.Dunlap wrote:

> On Thu, 18 Mar 2004 18:17:59 +0100 Bartlomiej Zolnierkiewicz wrote:
> 
> | 
> | > @@ -354,7 +354,7 @@ static int idescsi_end_request (ide_driv
> | >  			if (!test_bit(PC_WRITING, &pc->flags) && pc->actually_transferred &&
> | > pc->actually_transferred <= 1024 && pc->buffer) { printk(", rst = ");
> | >  				scsi_buf = pc->scsi_cmd->request_buffer;
> | > -				hexdump(scsi_buf, IDE_MIN(16, pc->scsi_cmd->request_bufflen));
> | > +				hexdump(scsi_buf, min_t(int, 16, pc->scsi_cmd->request_bufflen));
> | >  			} else printk("\n");
> | >  		}
> | >  	}
> | 
> | 'unsigned' should be used instead of 'int'
> | (scsi_cmd->request_bufflen is 'unsigned')
> | 
> | > @@ -371,7 +371,7 @@ static int idescsi_end_request (ide_driv
> | >
> | >  static inline unsigned long get_timeout(idescsi_pc_t *pc)
> | >  {
> | > -	return IDE_MAX(WAIT_CMD, pc->timeout - jiffies);
> | > +	return max_t(long, WAIT_CMD, pc->timeout - jiffies);
> | >  }
> | >
> | >  /*
> | 
> | pc->timeout and jiffies are of 'unsigned long' type
> | so why 'long' is used here?  Timer wrapping protection?
> 
> Yes, I think so.  (see below)
> 
> | Otherwise patches look okay and I will push them to Linus
> | as soon as somebody explains this 'long' thing to me. :-)
> 
> Michael hasn't replied on this AFAIK.

Sorry for being quiet, I'm busy right now looking for a new job.

Anyway, IIRC I choose 'long' because of the jiffies.h too, but I'm 
willing to change that back to 'unsigned long'.

> 
> 'long' looks correct to me, just based on include/linux/jiffies.h.
> In that case, someone has thought lots more about it than I have
> and concluded that while jiffies is stored as 'unsigned long',
> comparing times is correct when coerced (typecast) to long, as in:
> 
> #define time_after(a,b)		\
> 	(typecheck(unsigned long, a) && \
> 	 typecheck(unsigned long, b) && \
> 	 ((long)(b) - (long)(a) < 0))
> 
> But if you think it's risky, let's just drop it.
> 
> | If somebody is interested there are still related things to fix in IDE code:
> | 
> | drivers/ide/ide-cd.c:
> | use 'unsigned' instead of 'int' for nskip, sectors_to_transfer, len variables
> | 
> | ide-timing.h:
> | get rid of MIN()/MAX() macros, this should be done very carefully
> | as they are used for calculating timings

Where's the risk in that? An example would be very helpful.
Thanks for the help

Veeck

> 
> 
> --
> ~Randy
> 
> 


--===============4695877104976266==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4695877104976266==--

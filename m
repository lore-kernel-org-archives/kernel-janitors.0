From: "chas williams - CONTRACTOR" <chas@cmf.nrl.navy.mil>
Date: Sat, 16 Feb 2008 13:32:17 +0000
Subject: Re: [PATCH 5/6] drivers/atm: Use DIV_ROUND_UP
Message-Id: <200802161332.m1GDWHxG002210@cmf.nrl.navy.mil>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0802141615470.1185@pc-041.diku.dk>
References: <Pine.LNX.4.58.0802141615470.1185@pc-041.diku.dk>
In-Reply-To: <Pine.LNX.4.58.0802141615470.1185@pc-041.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In message <Pine.LNX.4.58.0802141615470.1185@pc-041.diku.dk>,Julia Lawall write
s:
>In each case below, I have followed the original semantics, but in
>drivers/atm/eni.c and drivers/atm/horizon.c, I have some doubts as to
>whether the original semantics is correct.  In drivers/atm/eni.c, is the
>division intended to be by div or by div-1?  In drivers/atm/horizon.c, it
>seems strange that "case round_down" is implemented by DIV_ROUND_UP, twice.
>The round_down and default (ie round_up) cases seem to be inversed.

i guess it might seem confusing.  to round the cell rate down, you need
to round the clock period up for the hardware scheduler.  so the up/down
refer to the atm rate, not the clock period which is what appears to be
computed in the following sections.

for example, in the eni driver, but comp_tx() is computing a clock
period. to round the desired cell rate down, the clock period is
rounded up.  

>diff -u -p a/drivers/atm/eni.c b/drivers/atm/eni.c
>--- a/drivers/atm/eni.c 2007-07-20 15:28:28.000000000 +0200
>+++ b/drivers/atm/eni.c 2008-02-13 20:50:10.000000000 +0100
>@@ -1270,7 +1270,7 @@ static int comp_tx(struct eni_dev *eni_d
> 			if (*pre < 3) (*pre)++; /* else fail later */
> 			div = pre_div[*pre]*-*pcr;
> 			DPRINTK("max div %d\n",div);
>-			*res = (TS_CLOCK+div-1)/div-1;
>+			*res = DIV_ROUND_UP(TS_CLOCK, div)-1;
> 		}
> 		if (*res < 0) *res = 0;
> 		if (*res > MID_SEG_MAX_RATE) *res = MID_SEG_MAX_RATE;
>diff -u -p a/drivers/atm/horizon.c b/drivers/atm/horizon.c
>--- a/drivers/atm/horizon.c 2007-11-08 18:33:26.000000000 +0100
>+++ b/drivers/atm/horizon.c 2008-02-13 20:50:13.000000000 +0100
>@@ -635,7 +635,7 @@ static int make_rate (const hrz_dev * de
> 		// take care of rounding
> 		switch (r) {
> 			case round_down:
>-				pre = (br+(c<<div)-1)/(c<<div);
>+				pre = DIV_ROUND_UP(br, c<<div);
> 				// but p must be non-zero
> 				if (!pre)
> 					pre = 1;
>@@ -668,7 +668,7 @@ static int make_rate (const hrz_dev * de
> 			// take care of rounding
> 			switch (r) {
> 				case round_down:
>-					pre = (br+(c<<div)-1)/(c<<div);
>+					pre = DIV_ROUND_UP(br, c<<div);
> 					break;
> 				case round_nearest:
> 					pre = (br+(c<<div)/2)/(c<<div);
>@@ -698,7 +698,7 @@ got_it:
> 		if (bits)
> 			*bits = (div<<CLOCK_SELECT_SHIFT) | (pre-1);
> 		if (actual) {
>-			*actual = (br + (pre<<div) - 1) / (pre<<div);
>+			*actual = DIV_ROUND_UP(br, pre<<div);
> 			PRINTD (DBG_QOS, "actual rate: %u", *actual);
> 		}
> 		return 0;

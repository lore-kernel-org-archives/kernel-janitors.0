From: "chas williams (contractor)" <chas@cmf.nrl.navy.mil>
Date: Thu, 23 Sep 2004 16:26:05 +0000
Subject: [Kernel-janitors] Re: [PATCH][ATM]: [drivers] use msleep() instead
Message-Id: <200409231626.i8NGQ44f014489@ginger.cmf.nrl.navy.mil>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63701442582602974=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <nacc@us.ibm.com>
In-Reply-To: Message from Nishanth Aravamudan <nacc@us.ibm.com>
   of "Thu, 23 Sep 2004 09:07:10 PDT." <20040923160710.GB1699@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: netdev@oss.sgi.com, davem@redhat.com, kernel-janitors@lists.osdl.org

--===============63701442582602974==

oops. sorry about that.  dave, please apply the following patch.

thanks!

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2004/09/23 12:24:28-04:00 chas@relax.cmf.nrl.navy.mil 
#   [ATM]: [lanai] get sleep interval right
# 
# drivers/atm/lanai.c
#   2004/09/23 12:24:12-04:00 chas@relax.cmf.nrl.navy.mil +1 -1
#   [ATM]: [lanai] get sleep interval right
# 
diff -Nru a/drivers/atm/lanai.c b/drivers/atm/lanai.c
--- a/drivers/atm/lanai.c	2004-09-23 12:25:36 -04:00
+++ b/drivers/atm/lanai.c	2004-09-23 12:25:36 -04:00
@@ -813,7 +813,7 @@
 			DPRINTK("read, write = %d, %d\n", read, write);
 			break;
 		}
-		msleep(4);
+		msleep(40);
 	}
 	/* 15.2.2 - clear out all tx registers */
 	cardvcc_write(lvcc, 0, vcc_txreadptr);

In message <20040923160710.GB1699@us.ibm.com>,Nishanth Aravamudan writes:
>On Tue, Sep 21, 2004 at 04:29:19PM -0400, chas williams (contractor) wrote:
>
><snip>
>> diff -Nru a/drivers/atm/lanai.c b/drivers/atm/lanai.c
>> --- a/drivers/atm/lanai.c	2004-09-21 12:48:17 -04:00
>> +++ b/drivers/atm/lanai.c	2004-09-21 12:48:17 -04:00
>> @@ -813,7 +813,7 @@
>>  			DPRINTK("read, write = %d, %d\n", read, write);
>>  			break;
>>  		}
>> -		schedule_timeout(HZ / 25);
>> +		msleep(4);
>
>Somehow this got changed for msleep(40); to msleep(4); !! :) The patch I
>sent on 15 September had msleep(40); in it, at least. If you could make
>the change in your bk, that would be great!
>
>-Nish
>

--===============63701442582602974==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63701442582602974==--

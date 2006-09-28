From: Badari Pulavarty <pbadari@us.ibm.com>
Date: Thu, 28 Sep 2006 18:18:13 +0000
Subject: [KJ] rtc driver question
Message-Id: <1159467493.1709.75.camel@dyn9047017100.beaverton.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I am looking at request_region() error cleanups and noticed
that rtc driver (char/rtc.c) rp_init() is doing in few 
conditions

                if (RTC_IOMAPPED)
                        release_region(RTC_PORT(0), RTC_IO_EXTENT);
                else
                        release_mem_region(RTC_PORT(0), RTC_IO_EXTENT);

but in some error conditions its doing..

		release_region(RTC_PORT(0), RTC_IO_EXTENT);
		

Shouldn't these be like above (release_mem depending on iomapped or
not) ?

Thanks,
Badari

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

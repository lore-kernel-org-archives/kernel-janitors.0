From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Jul 2016 07:36:53 +0000
Subject: Re: staging: ks7010: Return directly after a failed kmalloc()
Message-Id: <05ce8907-e899-cfea-7e42-a20a0113aa19@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <3aa380a9-afe6-6dc8-7533-6747afeb1bdc@users.sourceforge.net>
 <alpine.DEB.2.10.1607172057500.3177@hadrien> <20160720154756.GC1688@katana>
 <2071ae3b-9878-c798-6ead-897d1dd0d116@users.sourceforge.net>
 <20160721062543.GA1664@katana>
In-Reply-To: <20160721062543.GA1664@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> I guess that further clarification might be needed for affected
>> implementation details.
> 
> That's OK, too.
> 
> Acked-by: Wolfram Sang <wsa@the-dreams.de>

Does this acknowledgement include also the acceptance for
the suggested change around calls of the functions "sdio_claim_host"
and "sdio_release_host" within the implementation of the
function "ks7010_upload_firmware"?
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drivers/staging/ks7010/ks7010_sdio.c?id123042d0dbf7635f052efc2ae69fd9af624f1d#n771

Regards,
Markus

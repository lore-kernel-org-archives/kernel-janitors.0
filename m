From: "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 02 Apr 2004 17:34:18 +0000
Subject: Re: [Kernel-janitors] [REDIFF] - drivers/block/floppy.c audit.
Message-Id: <20040402143418.2e435ad7.lcapitulino@prefeitura.sp.gov.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1078867777.28746.11.camel@telecentrolivre>
In-Reply-To: <1078867777.28746.11.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em Fri, 2 Apr 2004 09:05:49 -0800
"Randy.Dunlap" <rddunlap@osdl.org> escreveu:

| | | | - del_timer() for all disks.
| | | | 
| | | |  Randy, I'm using del_timer in the while() loop. Do you
| | | | still believe that is wrong ?
| | | 
| | | You mean in out_del_gendisk: ?
| | 
| |  don't, I'm speaking about out_put_disk.
| 
| I renamed it to out_put_disk.  AFAIK the code in the new
| 2.6.5-rc3-kj1 patchset is OK.  Did you check it?
|    http://developer.osdl.org/rddunlap/kj-patches/2.6.5-rc3/split/patches/floppy_audit_v2.patch

 Just now. So, that's ok.

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

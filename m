From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 19 Feb 2004 01:06:14 +0000
Subject: Re: [Kernel-janitors] [PATCH] 90 patches for unnecessary casts
Message-Id: <20040218170614.3b3c7cc0.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040125105212.GA2064@localhost>
In-Reply-To: <20040125105212.GA2064@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 25 Jan 2004 11:52:13 +0100 Carlo Perassi <carlo@linux.it> wrote:

| Hi.
| With more scripting and manual check, I patched 90 files removing
| their unnecessary casts (see line 345 of TODO).
| 
| I don't attach the patch file here because it is huge (~ 177 KB).
| You can find it as a .tar.gz of 90 patch files here:
| http://www.linux.it/~carlo/somehacks/tkp/90patches.tar.gz
| You can also find the 90 text file patches here:
| http://www.linux.it/~carlo/somehacks/tkp/
| their names are file*.

Hi Carlo,

I have most of these merged, but some of the changes no longer
apply.  Please rediff and resend the changes for:

drivers/net/3c527.c
drivers/net/tc35815.c
drivers/net/68360enet.c

(against 2.6.3).

Thanks,
--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

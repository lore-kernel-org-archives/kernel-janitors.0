From: Domen Puncer <domen@coderock.org>
Date: Mon, 12 Jan 2004 13:18:15 +0000
Subject: Re: [Kernel-janitors] [announce] new KJ web hosting
Message-Id: <200401121418.15029.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040111193612.2b4445fc.rddunlap@osdl.org>
In-Reply-To: <20040111193612.2b4445fc.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 12 of January 2004 13:39, Christoph Hellwig wrote:
> On Mon, Jan 12, 2004 at 12:23:39PM +0100, Domen Puncer wrote:
> > - replacing __FUNCTION__ with __func__ .
>
> No.  We had this issue a few times already. __func__ is not supported
> on older gcc releases while __FUNCTION__ works fine on all.

Ok... but at least we can remove string concatenation with __FUNCTION__ (get 
rid of warnings, and get ready for __func__):
-printk(KERN_INFO "blabla " __FUNCTION__ "\n");
+printk(KERN_INFO "blabla %s\n", __FUNCTION__);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

From: Dave Jones <davej@redhat.com>
Date: Mon, 12 Jan 2004 18:01:30 +0000
Subject: Re: [Kernel-janitors] [announce] new KJ web hosting
Message-Id: <20040112180130.GQ14674@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040111193612.2b4445fc.rddunlap@osdl.org>
In-Reply-To: <20040111193612.2b4445fc.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 12, 2004 at 09:52:31AM -0800, Randy.Dunlap wrote:
 > | May i suggest adding this to TODO:
 > | - replacing __FUNCTION__ with __func__ .
 > | - pr_debug() from kernel.h could replace a lot of DPRINTK and similar macros.
 > | - same for pr_info()
 > | - min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.
 > 
 > All added, with changes from later emails from Christoph and Domen.

Thanks for taking care of this, I did the quick-fix stuff earlier,
but didn't get chance to pick over the meaty parts 8-)

		Dave

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

From: Christoph Hellwig <hch@infradead.org>
Date: Mon, 12 Jan 2004 12:39:15 +0000
Subject: Re: [Kernel-janitors] [announce] new KJ web hosting
Message-Id: <20040112123915.A1544@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040111193612.2b4445fc.rddunlap@osdl.org>
In-Reply-To: <20040111193612.2b4445fc.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 12, 2004 at 12:23:39PM +0100, Domen Puncer wrote:
> - replacing __FUNCTION__ with __func__ .

No.  We had this issue a few times already. __func__ is not supported
on older gcc releases while __FUNCTION__ works fine on all.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

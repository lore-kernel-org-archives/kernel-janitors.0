From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 27 Jul 2004 12:21:11 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] radio/radio-sf16fmi: replace
Message-Id: <20040727132111.A19394@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0013167806732874432=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41058881.1080406@zabbo.net>
In-Reply-To: <41058881.1080406@zabbo.net>
To: kernel-janitors@vger.kernel.org

--===============0013167806732874432==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 01:38:05PM +0200, Petr Vandrovec wrote:
> I do not agree. Delay is here just to make sure that we do not talk
> to chip too quickly after sending previous command (it is important
> especially for get signal strength; I think that it is not needed
> at all in set frequency), and as such it does not matter whether we 
> wait 100ms, 143ms, or one second. I find busy loop with mdelay 
> unacceptable.

This is msleep, not mdelay, and _not_ a busywait.


--===============0013167806732874432==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0013167806732874432==--

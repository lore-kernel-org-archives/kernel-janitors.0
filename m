From: "Petr Vandrovec" <VANDROVE@vc.cvut.cz>
Date: Tue, 27 Jul 2004 14:13:57 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] radio/radio-sf16fmi: repl
Message-Id: <D51111C6A7D@vcnet.vc.cvut.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38492180811247745=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41058881.1080406@zabbo.net>
In-Reply-To: <41058881.1080406@zabbo.net>
To: kernel-janitors@vger.kernel.org

--===============38492180811247745==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT

On 27 Jul 04 at 13:21, Christoph Hellwig wrote:
> On Tue, Jul 27, 2004 at 01:38:05PM +0200, Petr Vandrovec wrote:
> > I do not agree. Delay is here just to make sure that we do not talk
> > to chip too quickly after sending previous command (it is important
> > especially for get signal strength; I think that it is not needed
> > at all in set frequency), and as such it does not matter whether we 
> > wait 100ms, 143ms, or one second. I find busy loop with mdelay 
> > unacceptable.
> 
> This is msleep, not mdelay, and _not_ a busywait.

Oops. Sorry for confusion then. 
                                        Petr Vandrovec
                                        


--===============38492180811247745==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38492180811247745==--

From: Domen Puncer <domen@coderock.org>
Date: Sat, 22 May 2004 23:11:31 +0000
Subject: [Kernel-janitors] Re: request_region() on sound/oss/wavfront.c.
Message-Id: <20040522231131.GB1643@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9839313607713156=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040522224343.GA1643@masina>
In-Reply-To: <20040522224343.GA1643@masina>
To: kernel-janitors@vger.kernel.org

--===============9839313607713156==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 23/05/04 00:43 +0200, Domen Puncer wrote:
> On 22/05/04 18:54 -0300, Gustavo Franco wrote:
> 
> > +++ sound/oss/wavfront.c  2004-05-22 18:28:38.000000000 -0300
> > +       if (!request_region (io_base, 16, "wavefront")) {
> Few lines later there is a:
> 	dev.base = io_base;
> So this will print ugly error messages.
> 
> > +       if(!request_region (dev.base+2, 6, "wavefront synth")) {
> > +               if(!request_region (dev.base+8, 8, "wavefront fx")) {
> 
> IMHO, you can just get rid of latter 2 request_region's.

Ehm, no, damn. Comment above check_region states that device can take
up 8 ports.

So if there is another device on base+8 this wont work correctly (if that
device registred it's region before, even the old code wont work ok).


> And don't forget about release_region.


--===============9839313607713156==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9839313607713156==--

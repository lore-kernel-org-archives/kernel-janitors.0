From: Anupam Kapoor <anupam.kapoor@gmail.com>
Date: Wed, 30 Jun 2004 11:09:48 +0000
Subject: [Kernel-janitors] Re: set_current_state
Message-Id: <e31776304063003572e02caf1@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47892561205488415=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040627223356.GA1653@masina>
In-Reply-To: <20040627223356.GA1653@masina>
To: kernel-janitors@vger.kernel.org

--===============47892561205488415==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Jun 2004 16:33:12 +0200, Domen Puncer <domen@coderock.org> wrote:
> On 28/06/04 18:51 +0530, Anupam Kapoor wrote:
> > hi,
> >
> > i just checked with the latest sources and there are 417 entries with
> > 'current->state'. is a blind search-replace to set_current_state ok ?
> 
> Yes, usualy.
> Or maybe you should use __set_current_state (but do we really care that
> much about performance before schedule()?).
> 
> Opinions?
hmm, i am not sure about this but does it make sense to use
__set_current_state for functions that have fastcall ? and use
set_current_state for others ?

kind regards
anupam

>

--===============47892561205488415==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47892561205488415==--

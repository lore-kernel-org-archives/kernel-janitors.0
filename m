From: Anupam Kapoor <anupam.kapoor@gmail.com>
Date: Wed, 30 Jun 2004 12:56:54 +0000
Subject: Re: [Kernel-janitors] Re: set_current_state
Message-Id: <e3177630406300544ad84e7a@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40003578006199358=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040627223356.GA1653@masina>
In-Reply-To: <20040627223356.GA1653@masina>
To: kernel-janitors@vger.kernel.org

--===============40003578006199358==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Jun 2004 09:30:12 -0300, Felipe W Damasio
<felipewd@terra.com.br> wrote:
> 
> 
> Anupam Kapoor wrote:
> 
> > hmm, i am not sure about this but does it make sense to use
> > __set_current_state for functions that have fastcall ? and use
> > set_current_state for others ?
> 
>         It's not _that_ simple. We need set_current_state to racing if
> instructions are reordered.
can you please elaborate what you mean here, i don't understand the
connotations sorry !

> 
>         __set_current_state should *always* be used when setting to TASK_RUNNING.
> 
>         But since function calls act also as memory barriers and most of the
> locking primitives also have memory barriers built into them, there are
> few places where we actually need set_current_state (rather than
> __set_current_state).
ah ok ! thanks for the explanation. i will check out lkml for more info.

kind regards
anupam
> 
>         Please check the LKML archives for further explanations.
> 
>         But in short: No, it's not just a blind search-and-replace kind of thing.
> 
>         Cheers,
> 
> Felipe
> --
> It's most certainly GNU/Linux, not Linux. Read more at
> http://www.gnu.org/gnu/why-gnu-linux.html
>

--===============40003578006199358==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40003578006199358==--

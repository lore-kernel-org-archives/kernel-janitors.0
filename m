From: Felipe W Damasio <felipewd@terra.com.br>
Date: Wed, 30 Jun 2004 12:58:05 +0000
Subject: Re: [Kernel-janitors] Re: set_current_state
Message-Id: <40E2B8DD.4000504@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36987374235581227=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040627223356.GA1653@masina>
In-Reply-To: <20040627223356.GA1653@masina>
To: kernel-janitors@vger.kernel.org

--===============36987374235581227==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Anupam Kapoor wrote:
> can you please elaborate what you mean here, i don't understand the
> connotations sorry !

	There's the classic example that rml used when he wrote a few 
explanation notes of when set_current_state should be used.

	If we're setting the current task to TASK_* (other than RUNNING) and 
after that, manipulating some variable:

	current->state = TASK_INTERRUPTIBLE;
	if (doritos)
	{
		...
	}

	And on some of other code path we're checking to see if we're in 
TASK_INTERRUPTIBLE to also use the same variable:

	if (current->state == TASK_INTERRUPTIBLE)
	{
		do-something-to-doritos;
	}

	Then, in this case, we need a memory barrier the guarantee that the 
doritos variable will have the state set correctly _before_ manipulating it.

	But again, state setting that are still open coded are not that simple 
to see if we need set_current_state.

	Most places it's not the end of the world to have an useless memory 
barrier, but if we could things right and save an useless 
instruction..it'd be better.

	In short: If in doubt, always use set_current_state. :-)

	Cheers,

Felipe
-- 
It's most certainly GNU/Linux, not Linux. Read more at
http://www.gnu.org/gnu/why-gnu-linux.html

--===============36987374235581227==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36987374235581227==--

From: Felipe W Damasio <felipewd@terra.com.br>
Date: Wed, 30 Jun 2004 12:30:12 +0000
Subject: Re: [Kernel-janitors] Re: set_current_state
Message-Id: <40E2B254.2030603@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56817341903225249=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040627223356.GA1653@masina>
In-Reply-To: <20040627223356.GA1653@masina>
To: kernel-janitors@vger.kernel.org

--===============56817341903225249==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Anupam Kapoor wrote:

> hmm, i am not sure about this but does it make sense to use
> __set_current_state for functions that have fastcall ? and use
> set_current_state for others ?

	It's not _that_ simple. We need set_current_state to racing if 
instructions are reordered.

	__set_current_state should *always* be used when setting to TASK_RUNNING.

	But since function calls act also as memory barriers and most of the 
locking primitives also have memory barriers built into them, there are 
few places where we actually need set_current_state (rather than 
__set_current_state).

	Please check the LKML archives for further explanations.

	But in short: No, it's not just a blind search-and-replace kind of thing.

	Cheers,

Felipe
-- 
It's most certainly GNU/Linux, not Linux. Read more at
http://www.gnu.org/gnu/why-gnu-linux.html

--===============56817341903225249==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56817341903225249==--

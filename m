From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 29 Oct 2015 06:12:01 +0000
Subject: Re: [tpmdd-devel] [PATCH] TPM: Avoid reference to potentially freed memory
Message-Id: <5631B8B1.9020000@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445545961-5620-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <20151023073733.GA6941@intel.com> <20151027102723.GA9120@intel.com>
In-Reply-To: <20151027102723.GA9120@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, tpmdd-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org



Le 27/10/2015 11:27, Jarkko Sakkinen a =E9crit :
> On Fri, Oct 23, 2015 at 10:37:33AM +0300, Jarkko Sakkinen wrote:
>> On Thu, Oct 22, 2015 at 10:32:41PM +0200, Christophe JAILLET wrote:
>>> Reference to the 'np' node is dropped before dereferencing the 'sizep' =
and
>>> 'basep' pointers, which could by then point to junk if the node has been
>>> freed.
>>>
>>> Refactor code to call 'of_node_pup' later.
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> LGTM.
> Is there anyone able to provide Tested-by for this?
>
> Christophe, were you able to reproduce the crash (insmod/rmmod couple
> of times maybe?) and validate that it was gone after fixing the bug?

Hi,
no, I never triggered the bug.
This is just something noticed while looking at potential issues related=20
to incorrect use of 'of_node_pup'.
I only compile tested the patch.

Best regards,
CJ

>
>> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> /Jarkko
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

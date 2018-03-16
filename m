From: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 16 Mar 2018 10:26:53 +0000
Subject: Re: [PATCH] powerpc: Use common error handling code in setup_new_fdt()
Message-Id: <87bmfofh8y.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0dd9d938-8d89-f0e0-f05f-9a3e5dc42a57@users.sourceforge.net>
 <87fu52jqtc.fsf@morokweng.localdomain>
 <20180315115753.rjejlkrp3fhdxbyk@mwanda>
In-Reply-To: <20180315115753.rjejlkrp3fhdxbyk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@suse.de>, Brijesh Singh <brijesh.singh@amd.com>, Josh Sklar <sklar@linux.vnet.ibm.com>, Kees Cook <keescook@chromium.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:
> On Wed, Mar 14, 2018 at 06:22:07PM -0300, Thiago Jung Bauermann wrote:
>> SF Markus Elfring <elfring@users.sourceforge.net> writes:
>> > From: Markus Elfring <elfring@users.sourceforge.net>
>> > Date: Sun, 11 Mar 2018 09:03:42 +0100
>> >
>> > Add a jump target so that a bit of exception handling can be better reused
>> > at the end of this function.
>> >
>> > This issue was detected by using the Coccinelle software.
>> >
>> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> > ---
>> >  arch/powerpc/kernel/machine_kexec_file_64.c | 28 ++++++++++++----------------
>> >  1 file changed, 12 insertions(+), 16 deletions(-)
>> 
>> I liked it. Thanks!
>> 
>> Reviewed-by: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
>
> You know that compilers already re-use string constants so this doesn't
> actually save memory?

Sure, but it's still clearer to only have the string appear once in the
code.

> Also we should be preserving the error codes
> instead of always returning -EINVAL.

The error codes come from libfdt code, so they don't necessarily make
sense in the kernel. eg. FDT_ERR_NOSPACE = 3 = ESRCH.

Perhaps we should be trying harder to convert them, but that's a
criticism of the original code not this patch.

cheers

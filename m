From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 05:01:29 +0000
Subject: Re: [PATCH] powerpc/nvram: Replace kmalloc with kzalloc in the error message
Message-Id: <a3c158fa-3829-f38a-9202-8984b5ef5f21@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c3d22d89-9133-30aa-8270-c515df214963@web.de>
 <87imgai394.fsf@mpe.ellerman.id.au>
In-Reply-To: <87imgai394.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Michael Ellerman <mpe@ellerman.id.au>, Liao Pingfang <liao.pingfang@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>, Wang Liang <wang.liang82@zte.com.cn>, Anton Vorontsov <anton@enomsg.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Colin Cross <ccross@android.com>, Paul Mackerras <paulus@samba.org>, Xue Zhihong <xue.zhihong@zte.com.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>

>>> Please just remove the message instead, it's a tiny allocation that's
>>> unlikely to ever fail, and the caller will print an error anyway.
>>
>> How do you think about to take another look at a previous update suggestion
>> like the following?
>>
>> powerpc/nvram: Delete three error messages for a failed memory allocation
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net/
>> https://lore.kernel.org/linuxppc-dev/00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net/
>> https://lore.kernel.org/patchwork/patch/752720/
>> https://lkml.org/lkml/2017/1/19/537
>
> That deleted the messages from nvram_scan_partitions(), but neither of
> the callers of nvram_scan_paritions() check its return value or print
> anything if it fails. So removing those messages would make those
> failures silent which is not what we want.

* How do you think about information like the following?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=f359287765c04711ff54fbd11645271d8e5ff763#n883
“…
These generic allocation functions all emit a stack dump on failure when used
without __GFP_NOWARN so there is no use in emitting an additional failure
message when NULL is returned.
…”

* Would you like to clarify software development concerns around
  the Linux allocation failure report any more?

Regards,
Markus

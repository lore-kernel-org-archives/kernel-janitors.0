From: Daniel Borkmann <daniel@iogearbox.net>
Date: Tue, 22 Aug 2017 22:33:17 +0000
Subject: Re: [PATCH][next] MIPS,bpf: fix missing break in switch statement
Message-Id: <599CB12D.8090301@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170822220349.5648-1-colin.king@canonical.com> <93479b06-c3a2-a08a-fe5c-d8f155efeacc@caviumnetworks.com>
In-Reply-To: <93479b06-c3a2-a08a-fe5c-d8f155efeacc@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Daney <ddaney@caviumnetworks.com>, Colin King <colin.king@canonical.com>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, "David S . Miller" <davem@davemloft.net>, linux-mips@linux-mips.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/23/2017 12:29 AM, David Daney wrote:
> On 08/22/2017 03:03 PM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is a missing break causing a fall-through and setting
>> ctx.use_bbit_insns to the wrong value. Fix this by adding the
>> missing break.
>>
>> Detected with cppcheck:
>> "Variable 'ctx.use_bbit_insns' is reassigned a value before the old
>> one has been used. 'break;' missing?"
>>
>> Fixes: 8d8d18c3283f ("MIPS,bpf: Fix using smp_processor_id() in preemptible splat.")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Crap!  That slipped through.  Thanks for fixing it.
>
> Tested and ...
>
> Acked-by: David Daney <david.daney@cavium.com>

Colin, can you send this with David's ACK to netdev in Cc
so it lands in patchwork? It's for net-next tree. Thanks!

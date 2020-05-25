From: Daniel Borkmann <daniel@iogearbox.net>
Date: Mon, 25 May 2020 22:23:07 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust entry in XDP SOCKETS to actual file name
Message-Id: <22339b06-2cf1-0a3a-5813-86651ecd8d03@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200525141553.7035-1-lukas.bulwahn@gmail.com>
 <9d930e0e-5c77-11b8-6a8b-982fac711f6d@intel.com>
In-Reply-To: <9d930e0e-5c77-11b8-6a8b-982fac711f6d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>, Maxim Mikityanskiy <maximmi@mellanox.com>, maciej.fijalkowski@intel.com, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org
Cc: netdev@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/25/20 4:42 PM, Björn Töpel wrote:
> On 2020-05-25 16:15, Lukas Bulwahn wrote:
>> Commit 2b43470add8c ("xsk: Introduce AF_XDP buffer allocation API") added a
>> new header file include/net/xsk_buff_pool.h, but commit 28bee21dc04b
>> ("MAINTAINERS, xsk: Update AF_XDP section after moves/adds") added a file
>> entry referring to include/net/xsk_buffer_pool.h.
>>
>> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>>
>>    warning: no file matches  F:  include/net/xsk_buffer_pool.h
>>
>> Adjust the entry in XDP SOCKETS to the actual file name.
>>
>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>> ---
>> Björn, please pick this minor non-urgent patch.
>>
>> applies to next-20200525 on top of the commits mentioned above
>>
> 
> Thanks Lukas!
> 
> Daniel/Alexei, this should go to the bpf-next tree.

Yep, applied, thanks!

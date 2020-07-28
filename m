From: Yonghong Song <yhs@fb.com>
Date: Tue, 28 Jul 2020 19:12:47 +0000
Subject: Re: [PATCH][next] bpf: fix swapped arguments in calls to check_buffer_access
Message-Id: <7a0b563a-9853-9d6f-9d3a-0595e701c1b0@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727175411.155179-1-colin.king@canonical.com>
 <c9ea156a-20fa-5415-0d35-0521e8740ddc@fb.com>
 <882cd37d-0af2-3412-6bd7-73aa466df23c@iogearbox.net>
In-Reply-To: <882cd37d-0af2-3412-6bd7-73aa466df23c@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Borkmann <daniel@iogearbox.net>, Colin King <colin.king@canonical.com>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 7/28/20 3:43 AM, Daniel Borkmann wrote:
> On 7/27/20 11:39 PM, Yonghong Song wrote:
>> On 7/27/20 10:54 AM, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> There are a couple of arguments of the boolean flag zero_size_allowed
>>> and the char pointer buf_info when calling to function 
>>> check_buffer_access
>>> that are swapped by mistake. Fix these by swapping them to correct
>>> the argument ordering.
>>>
>>> Addresses-Coverity: ("Array compared to 0")
>>> Fixes: afbf21dce668 ("bpf: Support readonly/readwrite buffers in 
>>> verifier")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>
>> Thanks for the fix!
>> Acked-by: Yonghong Song <yhs@fb.com>
> 
> Sigh, thanks for the fix Colin, applied! Yonghong, could you follow-up with
> BPF selftest test cases that exercise these paths? Thx

This will be triggered with a verifier rejection path, e.g., negative 
offset from the base. I will send a follow-up patch soon.

BTW, using llvm to build the kernel (without this change), the compiler
actually issues a warning:

-bash-4.4$ make -j100 LLVM=1 && make LLVM=1 vmlinux
   GEN     Makefile
...
   CC      kernel/bpf/verifier.o
/data/users/yhs/work/net-next/kernel/bpf/verifier.c:3481:18: warning: 
expression which evaluates to zero treate$
  as a null pointer constant of type 'const char *' 
[-Wnon-literal-null-conversion]
                                           "rdonly", false,
                                                     ^~~~~
/data/users/yhs/work/net-next/kernel/bpf/verifier.c:3487:16: warning: 
expression which evaluates to zero treate$
  as a null pointer constant of type 'const char *' 
[-Wnon-literal-null-conversion]
                                           "rdwr", false,
                                                   ^~~~~
2 warnings generated.
   AR      kernel/bpf/built-in.a

Looks like I need to use LLVM compiler more often...

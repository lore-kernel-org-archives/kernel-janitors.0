From: Daniel Borkmann <daniel@iogearbox.net>
Date: Tue, 28 Jul 2020 10:43:52 +0000
Subject: Re: [PATCH][next] bpf: fix swapped arguments in calls to check_buffer_access
Message-Id: <882cd37d-0af2-3412-6bd7-73aa466df23c@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727175411.155179-1-colin.king@canonical.com>
 <c9ea156a-20fa-5415-0d35-0521e8740ddc@fb.com>
In-Reply-To: <c9ea156a-20fa-5415-0d35-0521e8740ddc@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yonghong Song <yhs@fb.com>, Colin King <colin.king@canonical.com>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 7/27/20 11:39 PM, Yonghong Song wrote:
> On 7/27/20 10:54 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There are a couple of arguments of the boolean flag zero_size_allowed
>> and the char pointer buf_info when calling to function check_buffer_access
>> that are swapped by mistake. Fix these by swapping them to correct
>> the argument ordering.
>>
>> Addresses-Coverity: ("Array compared to 0")
>> Fixes: afbf21dce668 ("bpf: Support readonly/readwrite buffers in verifier")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks for the fix!
> Acked-by: Yonghong Song <yhs@fb.com>

Sigh, thanks for the fix Colin, applied! Yonghong, could you follow-up with
BPF selftest test cases that exercise these paths? Thx

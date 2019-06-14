From: Daniel Borkmann <daniel@iogearbox.net>
Date: Fri, 14 Jun 2019 23:20:27 +0000
Subject: Re: [PATCH] selftests/bpf: signedness bug in enable_all_controllers()
Message-Id: <e81023df-a17a-57ae-854a-5b6e11ffef15@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613070021.GG16334@mwanda>
In-Reply-To: <20190613070021.GG16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Shuah Khan <shuah@kernel.org>, Roman Gushchin <guro@fb.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/13/2019 09:00 AM, Dan Carpenter wrote:
> The "len" variable needs to be signed for the error handling to work
> properly.
> 
> Fixes: 596092ef8bea ("selftests/bpf: enable all available cgroup v2 controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!

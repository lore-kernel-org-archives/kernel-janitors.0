From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 26 Aug 2020 16:22:07 +0000
Subject: Re: [PATCH][next] selftests/bpf: fix spelling mistake "scoket" -> "socket"
Message-Id: <CAADnVQL26-gaPy2yreDj=P00_Z0q6VunsP95goD6GfhhM_DuBA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200826085907.43095-1-colin.king@canonical.com>
In-Reply-To: <20200826085907.43095-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jiri Olsa <jolsa@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Aug 26, 2020 at 1:59 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake an a check error message. Fix it.

Kinda ironic that you've made a spelling mistake in the commit log
that fixes spelling in the test.
Whatever scripts you use to detect spelling errors, please use it
on your commit messages as well.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied with s/an/in/ in the commit log.

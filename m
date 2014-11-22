From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 22 Nov 2014 18:45:51 +0000
Subject: Re: [patch -next] bpf: null dereference allocating large arrays
Message-Id: <CAADnVQL+zgLbsAcLv-qSFmUi9yOy0qB9m-hO75E53fXu6yL6hA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141122183059.GC6994@mwanda>
In-Reply-To: <20141122183059.GC6994@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Nov 22, 2014 at 10:30 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> There is a typo here, "array" is null so we can't dereference it and
> also the size calculation should match the kzalloc() on the lines
> before.

Not sure what tree you're looking at...
it was more than typo, but it was fixed 4 days ago.
See commit daaf427c6ab39 ("bpf: fix arraymap NULL deref and missing
overflow and zero size checks")

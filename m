From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 20 Apr 2020 11:13:13 +0000
Subject: Re: [PATCH] tee: remove unnecessary NULL check in tee_shm_alloc()
Message-Id: <CAHUa44FJZtFpj2FcaYOBShMU5yjXfQmoVe3wJXemnTFDfRsD_Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Apr 7, 2020 at 11:32 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that "ctx" isn't checked consistently:
>
>     drivers/tee/tee_shm.c:164 tee_shm_alloc()
>     warn: variable dereferenced before check 'ctx' (see line 95)
>
> I audited the callers and "ctx" can't be NULL so the check can be
> removed.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/tee/tee_shm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks, I'm picking this up.

Cheers,
Jens

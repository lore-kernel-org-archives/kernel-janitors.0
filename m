From: John Stultz <john.stultz@linaro.org>
Date: Mon, 16 Dec 2019 21:07:26 +0000
Subject: Re: [PATCH][next] dma-buf: fix resource leak on -ENOTTY error return path
Message-Id: <CALAqxLVsFr6LLKvz9a5CRdddqhmMXUwKmfwqf3LRBbhksk5gHg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191216161059.269492-1-colin.king@canonical.com>
In-Reply-To: <20191216161059.269492-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>, "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, Sandeep Patil <sspatil@android.com>, dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>, linux-media@vger.kernel.org

On Mon, Dec 16, 2019 at 8:11 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The -ENOTTY error return path does not free the allocated
> kdata as it returns directly. Fix this by returning via the
> error handling label err.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: John Stultz <john.stultz@linaro.org>

Thanks so much for submitting this!

Sumit, do you mind queueing this up for drm-misc-next?

thanks
-john

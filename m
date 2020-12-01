From: Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 01 Dec 2020 07:58:11 +0000
Subject: Re: [PATCH] bus: mhi: core: Fix error handling in mhi_register_controller()
Message-Id: <CAMZdPi8eLwLxZQqQYLNQftwivfRYOKJkP1q195aeQ+Z0EX8gCg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8XqbtkPpEKSfFi2@mwanda>
In-Reply-To: <X8XqbtkPpEKSfFi2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bhaumik Bhatt <bbhatt@codeaurora.org>, Hemant Kumar <hemantk@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 1 Dec 2020 at 08:05, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There are a few problems with the error handling in this function.  They
> mostly center around the alloc_ordered_workqueue() allocation.
> 1) If that allocation fails or if the kcalloc() prior to it fails then
> it leads to a NULL dereference when we call
> destroy_workqueue(mhi_cntrl->hiprio_wq).
> 2) The error code is not set.
> 3) The "mhi_cntrl->mhi_cmd" allocation is not freed.
>
> The error handling was slightly confusing and I re-ordered it to be in
> the exact mirror/reverse order of how things were allocated.  I changed
> the label names to say what the goto does instead of describing where
> the goto comes from.
>
> Fixes: 8f7039787687 ("bus: mhi: core: Move to using high priority workqueue")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

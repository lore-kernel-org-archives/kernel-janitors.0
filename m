From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jan 2021 09:58:38 +0000
Subject: Re: [PATCH] soc: qcom: socinfo: Fix off-by-one array index bounds check
Message-Id: <20210120095837.GP2696@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210118113651.71955-1-colin.king@canonical.com>
In-Reply-To: <20210118113651.71955-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

There was a second one introduced recently as well.  I've sent a patch
for it.

regards,
dan carpenter

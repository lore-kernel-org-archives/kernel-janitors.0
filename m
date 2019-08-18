From: Stephen Boyd <sboyd@kernel.org>
Date: Sun, 18 Aug 2019 01:09:04 +0000
Subject: Re: [PATCH linux-next] qcom: qcs404: remove COMPILE_TEST from CONFIG_INTERCONNECT_QCOM_QCS404
Message-Id: <20190818010905.7AD602173B@mail.kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815074848.195806-1-maowenan@huawei.com>
In-Reply-To: <20190815074848.195806-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, agross@kernel.org, georgi.djakov@linaro.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Mao Wenan (2019-08-15 00:48:48)
> There is one compilation error when CONFIG_INTERCONNECT_QCOM_QCS404=y and
> CONFIG_INTERCONNECT_QCOM_SMD_RPM=y, as well as CONFIG_COMPILE_TEST=y,
> but CONFIG_QCOM_SMD_RPM is not set, logs as below:
> 
> drivers/interconnect/qcom/smd-rpm.o: In function `qcom_icc_rpm_smd_send':
> smd-rpm.c:(.text+0xe4): undefined reference to `qcom_rpm_smd_write'
> Makefile:1071: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1
> 
> This is because
> INTERCONNECT_QCOM_QCS404 depends on QCOM_SMD_RPM || COMPILE_TEST.
> Here CONFIG_COMPILE_TEST=y, so CONFIG_INTERCONNECT_QCOM_SMD_RPM
> is selected. If CONFIG_QCOM_SMD_RPM is not set, then
> qcom_rpm_smd_write() is not defined, and compilation error happen.
> Fix this by removing COMPILE_TEST from CONFIG_INTERCONNECT_QCOM_QCS404.

Can you fix the actual problem with compile testing this driver vs. just
removing the possibility to compile test. Otherwise it gives up on
the spirit of the idea of COMPILE_TEST.

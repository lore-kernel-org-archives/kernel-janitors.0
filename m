From: Anirban Chakraborty <anirban.chakraborty@qlogic.com>
Date: Fri, 15 Jun 2012 04:03:14 +0000
Subject: Re: [patch] qlcnic: off by one in qlcnic_init_pci_info()
Message-Id: <CC000197.32F56%anirban.chakraborty@qlogic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120614183424.GC6383@elgon.mountain>
In-Reply-To: <20120614183424.GC6383@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sony Chacko <sony.chacko@qlogic.com>, Dept-Eng Linux Driver <Linux-Driver@qlogic.com>, netdev <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



On 6/14/12 11:34 AM, "Dan Carpenter" <dan.carpenter@oracle.com> wrote:

>The adapter->npars[] array has QLCNIC_MAX_PCI_FUNC elements.  We
>allocate it that way a few lines earlier in the function.  So this test
>is off by one.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
>b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
>index 33c3e46..212c121 100644
>--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
>+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
>@@ -479,7 +479,7 @@ qlcnic_init_pci_info(struct qlcnic_adapter *adapter)
> 
> 	for (i = 0; i < QLCNIC_MAX_PCI_FUNC; i++) {
> 		pfn = pci_info[i].id;
>-		if (pfn > QLCNIC_MAX_PCI_FUNC) {
>+		if (pfn >= QLCNIC_MAX_PCI_FUNC) {
> 			ret = QL_STATUS_INVALID_PARAM;
> 			goto err_eswitch;
> 		}

Thanks for the patch.

Acked-by: Anirban Chakraborty <anirban.chakraborty@qlogic.com>



From: David Miller <davem@davemloft.net>
Date: Mon, 24 Feb 2020 01:27:11 +0000
Subject: Re: [PATCH] net: hns3: remove redundant initialization of pointer 'client'
Message-Id: <20200223.172711.2214140372026747021.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200222195231.200089-1-colin.king@canonical.com>
In-Reply-To: <20200222195231.200089-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, tanhuazhong@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Feb 2020 19:52:31 +0000

> @@ -9076,7 +9076,7 @@ static int hclge_init_nic_client_instance(struct hnae3_ae_dev *ae_dev,
>  static int hclge_init_roce_client_instance(struct hnae3_ae_dev *ae_dev,
>  					   struct hclge_vport *vport)
>  {
> -	struct hnae3_client *client = vport->roce.client;
> +	struct hnae3_client *client;
>  	struct hclge_dev *hdev = ae_dev->priv;
>  	int rst_cnt;
>  	int ret;

Please preserve the reverse christmas tree ordering of local variables when
you make changes like this.

From: David Miller <davem@davemloft.net>
Date: Sun, 21 Jul 2019 18:46:44 +0000
Subject: Re: [PATCH] net: hns3: typo in the name of a constant
Message-Id: <20190721.114644.1830499425455144315.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721130831.16330-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721130831.16330-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, tanhuazhong@huawei.com, lipeng321@huawei.com, shenjian15@huawei.com, liuzhongzhu@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 15:08:31 +0200

> All constant in 'enum HCLGE_MBX_OPCODE' start with HCLGE, except
> 'HLCGE_MBX_PUSH_VLAN_INFO' (C and L switched)
> 
> s/HLC/HCL/
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C18C2B9F7
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 06:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDEA861159
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 06:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbhEZG2M (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 May 2021 02:28:12 -0400
Received: from mga12.intel.com ([192.55.52.136]:2622 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232541AbhEZG2J (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 02:28:09 -0400
IronPort-SDR: znMT4jgzPExTbp+PtV4rIyxQ4+tyR4hgQ2r9n+yThmosB+k7+XUJcJmfAJOEGIUxO1f5uYRhdo
 Xs+JWpEZVnkA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182033919"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; 
   d="scan'208";a="182033919"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 23:26:01 -0700
IronPort-SDR: NbptjZ2eDH4V+udjtFv6y+Okd2g/v7v95KUxMFaDmxcLQFoJdHZA1i4yvSNJVbGOWsACupR+vM
 vCP/g5DBCwSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; 
   d="scan'208";a="547074744"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 25 May 2021 23:25:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 26 May 2021 09:25:57 +0300
Date:   Wed, 26 May 2021 09:25:57 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Badhri Jagan Sridharan <badhri@google.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] usb: typec: tcpci: Make symbol 'tcpci_apply_rc'
 static
Message-ID: <YK3p9ShJTqCLUle1@kuha.fi.intel.com>
References: <20210524133704.2432555-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524133704.2432555-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 24, 2021 at 01:37:04PM +0000, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> drivers/usb/typec/tcpm/tcpci.c:118:5: warning:
>  symbol 'tcpci_apply_rc' was not declared. Should it be static?
> 
> This symbol is not used outside of tcpci.c, so marks it static.
> 
> Fixes: 7257fbc7c598 ("usb: typec: tcpci: Implement callback for apply_rc")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 34b5095cc84f..22862345d1ab 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -115,7 +115,8 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
>  	return 0;
>  }
>  
> -int tcpci_apply_rc(struct tcpc_dev *tcpc, enum typec_cc_status cc, enum typec_cc_polarity polarity)
> +static int tcpci_apply_rc(struct tcpc_dev *tcpc, enum typec_cc_status cc,
> +			  enum typec_cc_polarity polarity)
>  {
>  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
>  	unsigned int reg;

-- 
heikki

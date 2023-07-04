Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4140EEB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 Jul 2023 09:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjGDJ6Y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 4 Jul 2023 05:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbjGDJ6V (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Jul 2023 05:58:21 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C0CD8
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 02:58:20 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3142ee41fd2so2898793f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jul 2023 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688464699; x=1691056699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YWyUoPaOombeDrDWZBro8KQ+sR0XnbUpjVH++v65VYo=;
        b=miOdESdy2upBwJi/t8/9qqu/dkeEELTNZ3bF6CZbiBvztc9y0eI5dibE45S4tCsOoX
         bWHmp4/+ujj1P9jpWEV27ur5ws90hITIACrErTnmfOikfEBl0uVG5hu/whxrRCdFcrhu
         25ULhzi5M809zrks2cC/xsWaoBshiyunYHP2+49/AgSxU88WUjcgTWUepNPQOZc9eK5z
         kMN+XXwqDnd45zIce2w1RQ9+VzOBmJ84ewv+w9BzWh4+Q8XcqmrrUqdhtUYROBeGfKkM
         xHNPPU107Vehc/YamzJ7nFi4hp82EYoWzqgZXVkCpASpsJkWgM+DSK7JSk9qiloHSCv+
         ljkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688464699; x=1691056699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWyUoPaOombeDrDWZBro8KQ+sR0XnbUpjVH++v65VYo=;
        b=TbLICG3YM8Yc7SU26oHzx0U7f/yEwpRzgXQDy2+z1NJWKPsXVgSJT/bgXLoNxiCIlJ
         s41Fc3sRso9ZVQE8tRfVNg2TqtXttGrqiqw3ScK65ASZGIBvZz3cNaeGg07IxrDWxCFS
         Wq1rt7jskkGzZNF8DyPo9+52bXPbT+d6sKrXRCgXwTdRTYJES4HhCO0hrRJNXnDw7GhO
         vrwxdu5u+GUzvRYYPVhGRlyGiqvPyVaTE3vR9VwKK+pnpp2Z1p1/mF0LgEPfu98VDfYt
         e4QX8BI1CxrNBKwlHBNKtF+Z/XO2xd8taYlS63iFdF9zakoZKd6kmqu22i/BoO6hFDQA
         6pHA==
X-Gm-Message-State: ABy/qLaiLsBjWB1wWxWRWGN+u5jGrJdBhYIfKCV+nFEMLsa3bzAnAo9S
        orh5Y5+ToQjsqYP7rTIZuzvAOw==
X-Google-Smtp-Source: APBJJlE5h6ah7q6vVL8qs9Ryg73a6WzNmZFOoQP7/aN2lxWhBCakmkzm/hyl9y8mBLJ9Egn72dyPcw==
X-Received: by 2002:a5d:4e88:0:b0:314:228:c769 with SMTP id e8-20020a5d4e88000000b003140228c769mr9757694wru.44.1688464698816;
        Tue, 04 Jul 2023 02:58:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c13-20020adfe74d000000b0030ae499da59sm12838791wrn.111.2023.07.04.02.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 02:58:16 -0700 (PDT)
Date:   Tue, 4 Jul 2023 12:58:13 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Cc:     Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Carl Vanderlip <quic_carlv@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <b1f8ccdf-144a-4156-af13-9d5731c5ab83@kadam.mountain>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
 <fb5f0a0c-c46f-4eec-bfcc-50b4be44c0a7@kadam.mountain>
 <eadc6f73-0fbf-80a0-cd1f-84f7fd51f6d7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eadc6f73-0fbf-80a0-cd1f-84f7fd51f6d7@quicinc.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 04, 2023 at 03:18:26PM +0530, Pranjal Ramajor Asha Kanojiya wrote:
> 
> 
> On 7/4/2023 2:08 PM, Dan Carpenter wrote:
> > On Tue, Jul 04, 2023 at 11:57:51AM +0530, Pranjal Ramajor Asha Kanojiya wrote:
> > > > diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> > > > index 5c57f7b4494e..a51b1594dcfa 100644
> > > > --- a/drivers/accel/qaic/qaic_control.c
> > > > +++ b/drivers/accel/qaic/qaic_control.c
> > > > @@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
> > > >    	int ret;
> > > >    	int i;
> > > > -	if (!user_msg->count) {
> > > > +	if (!user_msg->count ||
> > > > +	    user_msg->len < sizeof(*trans_hdr)) {
> > > >    		ret = -EINVAL;
> > > >    		goto out;
> > > >    	}
> > > > @@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
> > > >    	}
> > > >    	for (i = 0; i < user_msg->count; ++i) {
> > > > -		if (user_len >= user_msg->len) {
> > > > +		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
> > > If I understand correctly this check is added to verify if we are left with
> > > trans_hdr size of data. In that case '>' comparison operator should be used.
> > 
> > That was there in the original code and I thought about changing it but
> > I don't like changing things which aren't necessary and == is also
> > invalid so I decided to leave it.
> > 
> I see, I understand your concern about not changing unnecessary things but
> '>=' is incorrect for reason mentioned above. We need to change that to '>'

Oh, yes.  You're right.  I will need to resend.

regards,
dan carpenter


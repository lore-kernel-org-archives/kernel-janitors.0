Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976E3C7EE23
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 06:35:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjE3Gfi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 02:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjE3Gfh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 02:35:37 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407CBF1
        for <kernel-janitors@vger.kernel.org>; Mon, 29 May 2023 23:35:35 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso27282985e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 29 May 2023 23:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685428533; x=1688020533;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=55ZCWeFVfRDjQ05GnX/F+STnRavqIcQ2VYdd77KKqp4=;
        b=tutQjCisopkCpD5wYYwkWAYtOPB2ufq9Vtf/ppOb5goByihL6LbJIAmPpyUv4n+euf
         +XAw/zIWG+dUVZz5xYxa53c4nuPxx4S8u9LRDiUIhtW2eho2hIBv1TJQC+pswd2r8RvD
         sxeYGeFNm6DxmZmTv6200aFeO/OC2Vu0DPiPEgJaI8DECU4pHA9Aya5UMzB3TtaOVO1L
         rrjzKt9K0ExDjRy5lkGPus/GACM2QenOXTWrzaYzCTDIE+R9dmo8rSztyARS6AfNGDLl
         JrB5vaA9C/9U7TUxlYLubiJL4In7sxnsF1MPq9j9uL3c4XqIgnverDfv48EIp3bDX/Rm
         vciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685428533; x=1688020533;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55ZCWeFVfRDjQ05GnX/F+STnRavqIcQ2VYdd77KKqp4=;
        b=WouptWO90wmZ0p9OMeyP1tyecUoCZ/KBa7vgr/qFq8vv/msScn9jQ1LNPna0K6Ga09
         +Y50UWJYuIhfcykQzzEsFyuuKNTsluZZ9w/Uwc1GAmYfe22steM2ZAcOv9E4Yho9qSNh
         kOoJQvVnarSnbxNPJd/xqVh+Hf+B2nl8xM8cvHcYFN33BhsExsAt/tH2sBBihSwtqrgD
         VRwBTpNFXQPxBIea4aQx3e6VvpK8eiSiMGfnEpDwGA8KpsU+0xzXDm/hTMn1WholoGl+
         LURMNEKKXkSdS8KKBlgAny/jvr/Tecrh1BJUlphxTRupn8t1/sVNEOt8/ovN5ZsJeyTS
         q69Q==
X-Gm-Message-State: AC+VfDxFsWGC8q7TqWXRaVGFMkemexiIvEQsgE7tN5Z+bqA7KhKkTNWd
        Lj3K07kIk0CQg/GjH2G9VIHUsG2RNts2dUGVZOo=
X-Google-Smtp-Source: ACHHUZ7eORmmH8VljKaW+EPl8NgpTAfnSJgSygghBsbeWXcChcLDKGLwO8LQU4TW/6f1pT8g6eiXXQ==
X-Received: by 2002:a1c:7918:0:b0:3f6:244:55e3 with SMTP id l24-20020a1c7918000000b003f6024455e3mr664438wme.35.1685428533703;
        Mon, 29 May 2023 23:35:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c028900b003f42a75ac2asm16409818wmk.23.2023.05.29.23.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 23:35:31 -0700 (PDT)
Date:   Tue, 30 May 2023 09:35:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Julien Panis <jpanis@baylibre.com>
Cc:     Lee Jones <lee@kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] mfd: tps6594: Add driver for TI TPS6594 PMIC
Message-ID: <65b0fe53-ec91-479e-b55b-06af0678159b@kili.mountain>
References: <afd9a078-1002-4a26-a9b2-d92406912af5@kili.mountain>
 <44024069-723a-9726-7cdb-6c10a3ce2c7f@baylibre.com>
 <cf3ada2f-0c44-4389-9758-b72af9d138db@kili.mountain>
 <5d9f2dee-7c56-0220-48fb-c9fbdec1af29@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="jiB5S75U0rohqi0T"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d9f2dee-7c56-0220-48fb-c9fbdec1af29@baylibre.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--jiB5S75U0rohqi0T
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, May 26, 2023 at 10:00:19AM +0200, Julien Panis wrote:
> 
> > > Special handling for 'count == 1' (or 'count < 2') makes sense indeed.
> > > 
> > > I'm not sure that I fully understand, though. Will Smatch stop complaining
> > > for both things that you mentioned above with a patch for handling 'count < 2' ?
> > > Or will we consider either that warnings are handled, even if they are still there.
> > No, don't do anything to silence the warning.  Always fix the checker
> > instead of working around it.
> > 
> > Handling the "map->format.reg_bytes + map->format.pad_bytes + val_len"
> > is kind of complicated but still easier than handling the:
> > 
> > 	if (val_len % map->format.val_bytes)
> > 
> > condition in regmap_raw_write() just because it's closer together.  It's
> > quite a bit of code to write to silence this false positive but it's
> > something which could be done.
> > 
> 
> Who must fix 'smart' ? Me ?

Heh.  I wish.  I'll fix it.  (Eventually.  It's complicated).

> 
> I run 'smart' on my side and did not see the warnings you mentioned.
> Here are the commands I run:
> - [path to]/smatch/smatch_scripts/build_kernel_data.sh
> - [path to]/smatch/smatch_scripts/test_kernel.sh.sh
>   -> no warning for tps6594 mfd drivers in 'smatch_warns.txt'
> [path to]/smatch/smatch_scripts/kchecker tps6594-i2c.c
>   -> no warning
> [path to]/smatch/smatch_scripts/kchecker regmap.c
>   -> no warning related to tps6594 mfd driver
>   -> 2 errors for "uninitialized symbol 'ret'" in _regmap_raw_write/read()
> 
> Maybe I did not use the tool properly (?)

Sorry!  These underflow flow check isn't released.  I probably could
though.  It doesn't create too many false positives.  See attached.

drivers/clk/qcom/clk-rcg.c:618 clk_rcg_pixel_determine_rate() warn: 'request - delta' negative user limit promoted to high
drivers/clk/qcom/clk-rcg2.c:617 clk_edp_pixel_determine_rate() warn: 'request - delta' negative user limit promoted to high
drivers/clk/qcom/clk-rcg2.c:794 clk_pixel_determine_rate() warn: 'request - delta' negative user limit promoted to high
drivers/mfd/tps6594-i2c.c:159 tps6594_i2c_write() warn: 'count - 2' negative user limit promoted to high
drivers/gpu/drm/radeon/si.c:4594 si_vm_packet3_gfx_check() warn: 'pkt->count - 2' negative user limit promoted to high
drivers/gpu/drm/radeon/si.c:4697 si_vm_packet3_compute_check() warn: 'pkt->count - 2' negative user limit promoted to high
drivers/net/dsa/microchip/ksz8863_smi.c:66 ksz8863_mdio_write() warn: 'count - 4' negative user limit promoted to high
net/wireless/chan.c:456 cfg80211_set_chans_dfs_state() warn: 'center_freq + bandwidth / 2 - 10' negative user limit promoted to high
mm/page_isolation.c:558 start_isolate_page_range() warn: '(null)' negative user limit promoted to high

I think the radeon and wireless warnings look like real bugs.  The
rest are false positives.

I've looked at all these warnings before so they should have all been
false positives... :/

regards,
dan carpenter


--jiB5S75U0rohqi0T
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment;
	filename="check_negative_user_loop_promoted.c"

/*
 * Copyright (C) 2018 Oracle.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"
#include "smatch_extra.h"
#include "smatch_slist.h"

static int my_id;

static struct expression *warned;
static void match_condition(struct expression *expr)
{
	struct expression *right;
	struct range_list *rl;
	struct symbol *type;
	char *str;
	sval_t sval;

	if (warned == expr)
		return;
	if (expr->type != EXPR_COMPARE)
		return;

	switch (expr->op) {
	case '<':
	case SPECIAL_LTE:
	case SPECIAL_UNSIGNED_LT:
	case SPECIAL_UNSIGNED_LTE:
		break;
	default:
		return;
	}

	right = strip_expr(expr->right);
	if (right->type != EXPR_BINOP || right->op != '-')
		return;
	if (!get_user_rl(right->left, &rl))
		return;
	if (!get_implied_value(right->right, &sval))
		return;
	/*
	 * Unfortunately subtracting 1 to underflow is often done deliberately.
	 * It could be a bug or it could be not.  Silence everything.
	 */
	if (sval.value == 1)
		return;
	if (sval_cmp(rl_min(rl), sval) >= 0)
		return;

	type = get_type(expr);
	if (!type)
		return;
	if (type_is_ptr(type))
		return;
	if (!type_unsigned(type) || type_positive_bits(type) < 32)
		return;

	warned = expr;
	str = expr_to_str(right);
	sm_msg("warn: '%s' negative user limit promoted to high", str);
	free_string(str);
}

void check_negative_user_loop_promoted(int id)
{
	my_id = id;

	add_hook(&match_condition, CONDITION_HOOK);
}

--jiB5S75U0rohqi0T--

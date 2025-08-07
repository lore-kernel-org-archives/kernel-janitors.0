Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC75237173
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Aug 2025 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582426; cv=none; b=WgrdGm2BZoTDmypbQ8gT1P7OkOze2BU0Goz0xdYv4q2oDXM9EkKbfD4+59sxTpWjcPz/AVccHL+iwX6wG2FgAqGlsoPSZnGv0oQEeTGXnrZabQppiEHk1zHwK/DD6K+RnSvHbIzoBtFwf2E5msNvjKcKu1tzwhi3Z2qB1auOIRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582426; c=relaxed/simple;
	bh=atGLXNNVAwYLHEuEIqrV4tqMuprs0GfN6c3OC62xH3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BqKy4lRDcizZseafXfnsQ7pUZm0q2D5GiyUSl/o73y+6XFHM6Gk477peCKyl/QcXh9dJL+e4WXLgDNxOVRELtqKdSKhGxK7YvgPV9RFvpYx0ZhPBzSkgfkdmbLTr7Iw4UCHNZ2W+No8lZIORXTrXy3GGEj7o6p5W5RH1lsX4mdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+Uq9gY+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+Uq9gY+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-459e794b331so7605025e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Aug 2025 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582423; x=1755187223; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JcGfa+iZR61r0t/o0c+i1LBtwdud21b4gpEsVnOtuc=;
        b=D+Uq9gY+lobQnEX7FlGebVhVThPSKT7lE1g6t04zzfVI0Ly5XoULLDp66E+vTRmRvL
         GUxZKYA7Lfu6KR8H+0g1ezw27ncrL9mU1c8SWZhrPwdjmuMuAmAo729xQBIztN9+Ka9p
         VlQ1/XO0Pbu0Hbng0I/Df9sMGRyjilcDw+foHQ86hFmUBanvG1aU5f5wbOSR8zKBl13z
         pQcwJzYVN2qzGczt/9D0ISQIUuZTVrABUOcGIvlomb4nKNO2CHf6BsNrsep924V/LDes
         3OOEiRgUA4cKNMJUDubiHZosGxp5J+DjIA40fnJgvrEVkz/le+S6yZLZfu6B37WXHBw3
         z+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582423; x=1755187223;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+JcGfa+iZR61r0t/o0c+i1LBtwdud21b4gpEsVnOtuc=;
        b=AmwTX9ezxVHcbfcY653BoJtf4ijzgVnvbNVoa+JbukeQnhcQWvtKZoKwkG0gNIlMoh
         b6G7296/4CNXv8ITS3UmSoZtprXfhnh+v2R6JlnHfDiZuQmgZBJ8YWnVVk/pMzw8beO6
         zJrHvoRFZIAqVARALFa6ar/fQcEP56fURjWbgTIE05QytwRd7O5HnGAXNjAFNKUAKptg
         jzOGWmcPSG2hvb3Zdh4/XyDEvAlKJ7aRvE/gNDorG4d8PZCq8PkwDdX5FY357ExS0yEG
         UistT98JRDcilo1AzQD3mSwpRfIsOrwVsNWhDMnpkprUSCMNT0DHLC3TosdoTyrGW+gv
         cXbw==
X-Gm-Message-State: AOJu0YxkYqRNXRSnLU3IwUDj73oNAIfF6ErI3CzNsJ2JuqkF3FgN+fI0
	6nF3jXs3RFW3mS4FMenkxBOl5X5zFPMsTskP6dHbsGCIFdnsvHh719JrsRFSn44aPlPplqmaum/
	rWzRs
X-Gm-Gg: ASbGncu6FWI+t8zmGcMO8HrhZXgmYHS3Qb5olyjUWm6+WdB9yUKJqCg6kxg1LuheNb5
	59ADlGM9tcPwi6z795RWPq8EP8C68PtVLKZpO+Ajkq/MkSqOCxWN2f+lvNOB4snS75yyYVY2qgI
	O7JE7Rl5ZI0rnI/5GLzNG1kWqXWmrS0u+3KOQXiaUVWhQieXu8hb1HW7FZ1uemixk2gVdAwCTxy
	HlUjjRvh0NcwP7xO4CcoqrwcRA4dafvkA4o8vQrbBAV56K9lZYYuzeTR68JsfjMEq41gOXmLWAG
	BexcPNrDcu7G158aigGU3cWOveYvRoEZp1wv/dGWu+9ZTotqMg55bthiAKFKNyH5jUyPacKDWK6
	jOCGkIVJ7Cao5QifpnMJqemgOcd2JHhid
X-Google-Smtp-Source: AGHT+IHuq2MsXmiuXYo3HxEI3Rs3yJeaz7TDrZbqYvMeUuteV1ZfOlxYxnO6pziF3JOyU9waqi3k7g==
X-Received: by 2002:a05:600c:4449:b0:458:affe:a5c1 with SMTP id 5b1f17b1804b1-459f40937ddmr3882455e9.5.1754582422633;
        Thu, 07 Aug 2025 09:00:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c47ae8esm27179830f8f.61.2025.08.07.09.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 09:00:21 -0700 (PDT)
Date: Thu, 7 Aug 2025 19:00:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steen Hegelund <steen.hegelund@microchip.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] net: microchip: sparx5: Add KUNIT test of counters and
 sorted rules
Message-ID: <aJTNklKQ-yuxW0ck@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Steen Hegelund,

Commit dccc30cc4906 ("net: microchip: sparx5: Add KUNIT test of
counters and sorted rules") from Nov 11, 2022 (linux-next), leads to
the following Smatch static checker warning:

drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:305 test_vcap_xn_rule_creator() error: 'rule' dereferencing possible ERR_PTR()
drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:1422 vcap_api_encode_rule_test() error: 'rule' dereferencing possible ERR_PTR()

drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c
    246 static void test_vcap_xn_rule_creator(struct kunit *test, int cid,
    247                                       enum vcap_user user, u16 priority,
    248                                       int id, int size, int expected_addr)
    249 {
    250         struct vcap_rule *rule;
    251         struct vcap_rule_internal *ri;
    252         enum vcap_keyfield_set keyset = VCAP_KFS_NO_VALUE;
    253         enum vcap_actionfield_set actionset = VCAP_AFS_NO_VALUE;
    254         int ret;
    255 
    256         /* init before testing */
    257         memset(test_updateaddr, 0, sizeof(test_updateaddr));
    258         test_updateaddridx = 0;
    259         test_move_addr = 0;
    260         test_move_offset = 0;
    261         test_move_count = 0;
    262 
    263         switch (size) {
    264         case 2:
    265                 keyset = VCAP_KFS_ETAG;
    266                 actionset = VCAP_AFS_CLASS_REDUCED;
    267                 break;
    268         case 3:
    269                 keyset = VCAP_KFS_PURE_5TUPLE_IP4;
    270                 actionset = VCAP_AFS_CLASSIFICATION;
    271                 break;
    272         case 6:
    273                 keyset = VCAP_KFS_NORMAL_5TUPLE_IP4;
    274                 actionset = VCAP_AFS_CLASSIFICATION;
    275                 break;
    276         case 12:
    277                 keyset = VCAP_KFS_NORMAL_7TUPLE;
    278                 actionset = VCAP_AFS_FULL;
    279                 break;
    280         default:
    281                 break;
    282         }
    283 
    284         /* Check that a valid size was used */
    285         KUNIT_ASSERT_NE(test, VCAP_KFS_NO_VALUE, keyset);
    286 
    287         /* Allocate the rule */
    288         rule = vcap_alloc_rule(&test_vctrl, &test_netdev, cid, user, priority,
    289                                id);
    290         KUNIT_EXPECT_PTR_NE(test, NULL, rule);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
vcap_alloc_rule() doesn't return NULL, it returns error pointers.

    291 
    292         ri = (struct vcap_rule_internal *)rule;
    293 
    294         /* Override rule keyset */
    295         ret = vcap_set_rule_set_keyset(rule, keyset);
    296 
    297         /* Add rule actions : there must be at least one action */
    298         ret = vcap_rule_add_action_u32(rule, VCAP_AF_ISDX_VAL, 0);
    299 
    300         /* Override rule actionset */
    301         ret = vcap_set_rule_set_actionset(rule, actionset);
    302 
    303         ret = vcap_val_rule(rule, ETH_P_ALL);
    304         KUNIT_EXPECT_EQ(test, 0, ret);
--> 305         KUNIT_EXPECT_EQ(test, keyset, rule->keyset);
    306         KUNIT_EXPECT_EQ(test, actionset, rule->actionset);
    307         KUNIT_EXPECT_EQ(test, size, ri->size);
    308 
    309         /* Add rule with write callback */
    310         ret = vcap_add_rule(rule);
    311         KUNIT_EXPECT_EQ(test, 0, ret);
    312         KUNIT_EXPECT_EQ(test, expected_addr, ri->addr);
    313         vcap_free_rule(rule);
    314 }

regards,
dan carpenter

Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="elLTQnSm"
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADFF195
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Nov 2023 05:02:12 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3316ad2bee5so3253918f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Nov 2023 05:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700658131; x=1701262931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zAYBW/dYtjxj/mIFheTLcX/YTMyi0LyyXwltchBNxB0=;
        b=elLTQnSm9XJcVRx/bhUqjBEm8bMjSnlwe2U09kiu4T3UZthjhCyQIdHEoZ5G0bLVY3
         I6A+PC4GeGvd8r6Sl2x8/RVux5iMsz4TuhX2gry807Q8DGhNIp8DoLcToPirL/tFy+Cv
         8Q+Efj9qANkBAShtZNIItmh7POAQR0+V94968m6W/7h3N+ONZ70aj26lSKjKBCFWS+t2
         Mjr8HH25H53fkUlf8Y8q41p0l/rhYsrLPbWJMiO1ic3VL3kAHM/1BO1MrC6GBM6L+XZX
         I2LXvDpZvGu54DB4YuBCmCqxKl4+MqCnFYjswmET9slqhKNrcnmL422eUolzpdPiDJ/c
         Z+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700658131; x=1701262931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAYBW/dYtjxj/mIFheTLcX/YTMyi0LyyXwltchBNxB0=;
        b=XY17+pnXGPazu9oJh+cDZ4CnrpoD/ZhLAHj4L87F69sExTdzVHdqVljLNfeAIE5kQj
         AtzRRh3gKWxbvfpz0ebsYnDuo6Y0WvwslASY6fH6AE/dP9k2NPmuedHD3M3Dk181lAC8
         wDel5QOPFft9aaq8brY9ctkm4z5o8qBZ1HYpW+Bi4SfVr+zSADGVCBFr4HTrRJ4M1+2G
         K8W9/zrpn65sBcnSFlwwmQoCIth1JPJR2o6r8UQhqb++P/E/sXKkiTX+PqIK/9kldEgx
         XfIUm891KLYA8aU6uR4N5w+BrOVN+d9Iw+uuimmreosCJVSctmV30C01jEdntfjtt35A
         5RfA==
X-Gm-Message-State: AOJu0YzOcNTzpg7hGNm8F4USKW0trbPuIZc0n3otrFmU7RSdRZrpKr25
	VE/gUvNcjhO341Ct9BNMwde7Lg==
X-Google-Smtp-Source: AGHT+IFm/gvzWYz8Z3gyoz/52Dw4SJ4D1BBYzMbXvuiTFLxpBZfbv3NItqBLCI+UzFq90ikS/hTasA==
X-Received: by 2002:a5d:6843:0:b0:32f:e1a2:526a with SMTP id o3-20020a5d6843000000b0032fe1a2526amr266266wrw.67.1700658131308;
        Wed, 22 Nov 2023 05:02:11 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x11-20020adfffcb000000b003316b8607cesm16215688wrs.1.2023.11.22.05.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:02:10 -0800 (PST)
Date: Wed, 22 Nov 2023 08:02:06 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: pkshih@realtek.com, kvalo@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com, lizetao1@huawei.com,
	linville@tuxdriver.com, Larry.Finger@lwfinger.net,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH wireless-next 2/2] rtlwifi: rtl8821ae: phy: fix an
 undefined bitwise shift behavior
Message-ID: <2ec14802-78b0-4a3f-a730-19e95ec8d359@suswa.mountain>
References: <20231122090210.951185-1-suhui@nfschina.com>
 <20231122090210.951185-2-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122090210.951185-2-suhui@nfschina.com>

On Wed, Nov 22, 2023 at 05:02:12PM +0800, Su Hui wrote:
> Clang staic checker warning:
> drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c:184:49:
> 	The result of the left shift is undefined due to shifting by '32',
> 	which is greater or equal to the width of type 'u32'.
> 	[core.UndefinedBinaryOperatorResult]
> 
> If the value of the right operand is negative or is greater than or
> equal to the width of the promoted left operand, the behavior is
> undefined.[1][2]
> 
> For example, when using different gcc's compilation optimizaation options
> (-O0 or -O2), the result of '(u32)data << 32' is different. One is 0, the
> other is old value of data. Adding an u64 cast to fix this problem.
> 
> [1]:https://stackoverflow.com/questions/11270492/what-does-the-c-
> standard-say-about-bitshifting-more-bits-than-the-width-of-type
> [2]:https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf
> 
> Fixes: 21e4b0726dc6 ("rtlwifi: rtl8821ae: Move driver from staging to regular tree")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
> index 6df270e29e66..89713e0587b5 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
> @@ -106,7 +106,7 @@ u32 rtl8821ae_phy_query_bb_reg(struct ieee80211_hw *hw, u32 regaddr,
>  		regaddr, bitmask);
>  	originalvalue = rtl_read_dword(rtlpriv, regaddr);
>  	bitshift = _rtl8821ae_phy_calculate_bit_shift(bitmask);
> -	returnvalue = (originalvalue & bitmask) >> bitshift;
> +	returnvalue = (u64)(originalvalue & bitmask) >> bitshift;

This is a right shift, not a left shift. << vs >>.

>  
>  	rtl_dbg(rtlpriv, COMP_RF, DBG_TRACE,
>  		"BBR MASK=0x%x Addr[0x%x]=0x%x\n",
> @@ -128,7 +128,7 @@ void rtl8821ae_phy_set_bb_reg(struct ieee80211_hw *hw,
>  		originalvalue = rtl_read_dword(rtlpriv, regaddr);
>  		bitshift = _rtl8821ae_phy_calculate_bit_shift(bitmask);
>  		data = ((originalvalue & (~bitmask)) |
> -			((data << bitshift) & bitmask));
> +			(((u64)data << bitshift) & bitmask));

The checker is printing an accurate warning, however, I'm not sure the
fix is correct.  Obviously, shift wrapping is bad and your patch would
eliminate that possibility.  However, data is a u32 so we end up
discarding the high 32 bits.  I can imagine a different static checker
would complain about that.

Perhaps, a better way to silence the warning is to just change
_rtl8821ae_phy_calculate_bit_shift() to not return 32 bits?  Do we
really ever pass bitmask 0?  No idea...

regards,
dan carpenter

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
index 5323ead30db0..42885e3a458f 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
@@ -29,9 +29,7 @@ static void _rtl8821ae_phy_rf_serial_write(struct ieee80211_hw *hw,
 					   u32 data);
 static u32 _rtl8821ae_phy_calculate_bit_shift(u32 bitmask)
 {
-	u32 i = ffs(bitmask);
-
-	return i ? i - 1 : 32;
+	return ffs(bitmask) - 1;
 }
 static bool _rtl8821ae_phy_bb8821a_config_parafile(struct ieee80211_hw *hw);
 /*static bool _rtl8812ae_phy_config_mac_with_headerfile(struct ieee80211_hw *hw);*/

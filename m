Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFFB1DB12E
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736929248; cv=none; b=miN3tkh2OaR0u4DJq4yXimiEYlXGlJxJJ9MpUFsYB6bxgYf3uQUuqyb4nNY4SwkllBzzZq1ELzlDV5KJ8BmdPHTaQgVnrIkqfctwr5WC0Wa+y8W6eQjt0+xaxNI94QhBlQtRogssVAsmXzu0o1dzgkZ7msyP7UVyZR8x860OULc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736929248; c=relaxed/simple;
	bh=SYxPUi7qB00bEexxv5uaZyOlcqQie7Hjwm+LRuj14uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ky1NI1S3UMbEm7aKKqAoI8Ra04bALmK3iplGeO8NHJ04g0H7nsHix6hOVhiFpZ3NJjLG311Q6AxAaGtu9Wp+1n2kclG0LZ36IGq167vtBmJzUg1G4MnNQ0Gj36ST5S5L7D6Ok+7VBRGdLCXGxnJBhW3CSy+RHoA2SYaTuXh6hVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xwFPbC8A; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwFPbC8A"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38625aa01b3so648951f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 00:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736929245; x=1737534045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0efG6sveoUWaxA+bx5KyO07/pKf3ym8QvOhAj6YpWZ0=;
        b=xwFPbC8A2HY0sqJ26cqRSvnGhut+BhPy+Oi6pgHSDm0niimwkonpYB5Tv41ze3cJaE
         +Y/HKKF6CAeCXBhGnbLGLeNDNp/GmJWfXUyK47XtefPs3auxc0o1+lnGO8GOVnfnvKR2
         RpByqnD/8U8vXuJi0tF31kqRvDRra2CxRIZsSim0IgjYD+QFyicTh6NYW+zotn5ilHv3
         D1RvBPxcv74qZtqjPCjstj6ALgDTfCn1Kq25qx4tszgBWLLMWV8tmvvmgwnWVgWW+f8f
         Gd9ly91sGb+ISYcg+ZkVwypyTTU4nU+bzUXJYFTKmhlkMtArfhExlD6xq385QUNad+5x
         r0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929245; x=1737534045;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0efG6sveoUWaxA+bx5KyO07/pKf3ym8QvOhAj6YpWZ0=;
        b=VGRHR1un4G0EoNDUYbnRDUJj6VEOylJK8PEJCglITAZ5e89lNuXOw5/h3j6+8nnTie
         KLFb7xV+nDZF/4UVBt69KioTmvxN1lCfRMqC36zG5kwuq/nn2t/DiiP424ux7c8RUJ27
         o7c9X96yshbTVUJy6m+M+7ioKpSdNbopMv+vgjXIOCz1d1WcxvwP3yJtdobxYBWsgCz5
         Yzfuc/y8UvjKzyQgthu7UmXol4WyzsXavRM57h7Ck+wYUYfPYr7hWnh1ILLLp45wl8ID
         pqOO5Dv9OwwFPYnNCHPh5gYzIfc2xovEtACaFw0ZLO1MNypdxYYr4cMhJ/fzj6ONa2oC
         wI7g==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7/9ldAYoTrnmi+pUHi1/nshCFIXtWY1D14DOkN1tMECzZkZHyJSfOAM4wKvfgzgZAPzmOZb2VdCn6s5ie2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeeLfz3VeFs1BzSOQCnsqv8zDSHdNGHplPFRBSpAKH41yYXvRA
	IVQDS9kNVevoPNKCbu5KSq3PQrp9BbDE78Hv6nN0aHsX0E0KMx8X7pd+OMU5ecU=
X-Gm-Gg: ASbGnctH0i/Lygwd7aV43wv1qym9rW+lu3VffQkDY8KwXzazDSYr2pOkx6eCHunyhvM
	Ntg2zTV2atMbJutMoZrgKxzgKbSOSfNJCpKNQ+Uc2wBwimtotlx8L5aHsQ2EaTs4tGM7zO7oL/V
	cQrUKc4xkRY7ixE3h+xsDLXRrFnMmnzcxlpBVJGuJVZ/+bOjbYWJrqfwNBv5r+TDYO29im1awxT
	wOvhSgR8NoN+cbA3UxF+bgwNqsg0NZAXEzTEUmOZ5TkNsE0EVlxLM0kmS9ahz89HgboKQ8AROYU
X-Google-Smtp-Source: AGHT+IFnNs4LdDgn5hkXL2/wj94K3bSrrgWVJ2OlgTPdHqwLAfORDOLYq402mvygpSnbbRCJF55LCw==
X-Received: by 2002:a05:600c:35c2:b0:434:941c:9df2 with SMTP id 5b1f17b1804b1-436e272c89cmr100062085e9.8.1736929245083;
        Wed, 15 Jan 2025 00:20:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be66b01c7sm1654266f8f.22.2025.01.15.00.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 00:20:44 -0800 (PST)
Message-ID: <5af698ec-376c-4680-94a6-917ce92162f5@linaro.org>
Date: Wed, 15 Jan 2025 09:20:43 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] firmware: qcom: scm: Fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <a0845467-4f83-4070-ab1e-ff7e6764609f@stanley.mountain>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <a0845467-4f83-4070-ab1e-ff7e6764609f@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2025 07:52, Dan Carpenter wrote:
> Set the error code if devm_qcom_tzmem_pool_new() fails.  Don't return
> success.
> 
> Fixes: 1e76b546e6fc ("firmware: qcom: scm: Cleanup global '__scm' on probe failures")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Uh, one can stare at own code for hours and never see the issue.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

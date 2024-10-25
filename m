Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294A1B0F3E
	for <kernel-janitors@vger.kernel.org>; Fri, 25 Oct 2024 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729840012; cv=none; b=VEqU5GOQtNXbMYpSKOcV+/RgUb+PiXteP5ktkzzVqQlphjJXBh3+Z4/p0kMmyIWcnfOibEfCpWjGc6/blQF+HSZ7Oa4AzwPMaTUmFFOoVZp+xp2hcz4PX4z3T1UIWCGJ7dUjAJAsdTdjTlRTvylc4Lp/+Kw18cB9bdAh+OmNFJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729840012; c=relaxed/simple;
	bh=rkQE7YIpEQbUrEPfHWGa3mK7WoBXUnnaqE0WUW6yzPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WDaSAOqPXz5uIG1vRq0ddg59VvavTnDGLP5Hr5IqyB9CJuRrfNK7WlfZOUYRqJypG9EM/kveiIzjgRLZS7ns3j8MAqlKYIw4eKcaOU90JDMUwwYudzSQvJ/ZUzbF3AgE8FYy/3EZCwbAOq39vAp02P4TJIQjb9C3G6ClRtbVIcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXhttkxu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXhttkxu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so17564085e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Oct 2024 00:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729840008; x=1730444808; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIsqbAvxya9NETYgH6mSG74loRrqRLi0pQc/bZmvIDA=;
        b=IXhttkxul7XVo2rO8BjBmrq8qXNTxWajrr5BUT7qCtxzd7VjDp6LztsYukorOKr+KI
         T3KktEDCecf/soOzkpRkazbp6En5Gu3Ke+fU6+sRhrM4hBK3SME/gY3Isy/WwAdRvqjY
         QmGXnnK5OuNSpYPvFbeF3rrFMlINShqECQG80neIrN/Hh3vjbFcGC+XSQW7vdti3twcg
         RNyE53UdTRjiU69Q4Q9BjPIne7WrfvENMv4G/hHZb7D5y9iFeaxJlQ8Qi0t7V+ttoIng
         ziWZPMRe8jSAR29e+aYDtgETDptXhTjuAUHKZOXN+/hwZF6o3SpiE8s6guuwK3o/Ashw
         kcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729840008; x=1730444808;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nIsqbAvxya9NETYgH6mSG74loRrqRLi0pQc/bZmvIDA=;
        b=AzUXVJ9sjn7d9T9f6o12Md25aOXINVmm07S2chEmo98HFDY4pHY2+x0lD0PybUytnL
         N0pB+VGt1jydoYbwU/5nKmgYMpKlfI7M2XDNV93E2TeZZF0f/ChcOrLNz/6M1Bopkm+N
         wtvud1o9gpdNAlrtMZuHWaRo7cTeuhi0ijvNZCabeBdktrLEgxbjQjJKcIG/M+6yDx4r
         l6tdcLcWQqnvYbhjgSRuW73XaGqYYGsB5BKcVXmAnEXLilnsJyB+XyTXxQ23NrldTJ7r
         k0BRPDVd52vBeVd4iZnDvTDwipZp2JbNBt+ggcobhwqf9ShaO/jKgax3NhgIxnR5ulrt
         8v4g==
X-Forwarded-Encrypted: i=1; AJvYcCUScblDS0ssSyQSUFCbpnzBS6SDf/cOSiveAQiIek7a9e9B7Yq1roBc6v1uNlSCUvv8Hdco8CxOSkEWmMPhpzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqckkvHYJRsjl+pUlW3I2fl14k7oJzmZN6QdGabQHHVLAvcnzW
	iMEhiJ8GyrL0Bx0aZhNCf3Nl83ZsN+rGjnxdxFaYQ18Dh3GRqomr5f29Wzu+GG4=
X-Google-Smtp-Source: AGHT+IFDxpEXBGCkffse7fkCSwVB2T/xPt5joroOVn7BJWc3mEQhF1RGjY6fvVprtingP48ezETMtQ==
X-Received: by 2002:a05:600c:314d:b0:431:58bc:ad5e with SMTP id 5b1f17b1804b1-4318419a826mr71700265e9.28.1729840008063;
        Fri, 25 Oct 2024 00:06:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb4724sm757578f8f.115.2024.10.25.00.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:06:47 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:06:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] rcu: Unlock correctly in rcu_dump_cpu_stacks()
Message-ID: <b3b2a438-92d8-4b63-a71e-ad3a155b96d4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The unlock needs to be outside the } close curly braces for this if
statement.  Otherwise it leads to a deadlock.

Fixes: 744e87210b1a ("rcu: Finer-grained grace-period-end checks in rcu_dump_cpu_stacks()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 kernel/rcu/tree_stall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
index 8994391b95c7..925fcdad5dea 100644
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@ -357,8 +357,8 @@ static void rcu_dump_cpu_stacks(unsigned long gp_seq)
 					pr_err("Offline CPU %d blocking current GP.\n", cpu);
 				else
 					dump_cpu_task(cpu);
-			raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 			}
+			raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 		}
 		printk_deferred_exit();
 	}
-- 
2.45.2


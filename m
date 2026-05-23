Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6068331A66;
	Sat, 23 May 2026 02:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502820; cv=none; b=QWRnPVz2jx6fOZPhqM0rU6nbQPt9+/JBT6xc9MiRi+K3i9uoGYBhErJ1HOdT0rfcBLYYPWLo+K036EE3CywCZyyIsXmUcOYMvvN0hn5dqiRRK7ZN3WSUFgKYTUY4Pc3L9Fd3iIQLbS5YcAcB4otAwniG9IuQjzTJCIU9HVnonAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502820; c=relaxed/simple;
	bh=4hGp2YyUP7w7KQinh4CltFa4UubRkAk1+Zt4AqDB7UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l9jaT3XTbkrkz7qekkz6aLj1ddjZ2onfBIiArVomYhGcllgWinrkyRPZ9Y0UyjCruSCQ0Bzxiw0QaExCxonFPjDVfQ04Skg5hi4rh9a9H7ec6ncktQ4i8hd+lcCDGpfQC8xKbUWapimlP/HJR+OWG+MJYu9KXn2vCUvLTHpU9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oslTlZ1Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oslTlZ1Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455D81F00A3C;
	Sat, 23 May 2026 02:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502819;
	bh=bcPIxUvHgGdtSBhhYvBC/PBN8UIxKGAALdOD4/DM8m4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oslTlZ1Q6eR6V128UCwKjvSOGZ89aR+imSwXOLTBLbGRp79A7qW+JypzuXCvpTZGn
	 dq7qHxCCXTGWZQvW2O9RA1mAL++EPhGO5VrD6A4biJt6U6fqeSx52Ys/LCtz6MbNZj
	 Ato9igy1N7M1A2ya7Tk7+JbOWWIQO6/VA0GWpM3ZhW4oSrjXPmA/KQ+VNotprCCVKx
	 r+wH+U3Emhas+58SXt2ODm/2AO8itUmpg1xpnC8W/3jAjEmv0eMljTZs0ekhIyC0p/
	 Dw6o02m2l+WWFSORq//26BVl89qxm5SHosbTCGzYNwKPhbEfUNbi4lCQJkXKmbmbgV
	 1hF6p6LsR0dPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
	Dan Carpenter <error27@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] soc: qcom: llcc-qcom: Fix NULL vs IS_ERR() bug in qcom_llcc_get_fw_config()
Date: Fri, 22 May 2026 21:19:49 -0500
Message-ID: <177950280341.1097700.16184783444365378849.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ag1N_rAHEQ1YJsa7@stanley.mountain>
References: <ag1N_rAHEQ1YJsa7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 May 2026 09:00:30 +0300, Dan Carpenter wrote:
> The devm_memremap() function doesn't return NULL, it returns error
> pointers.  Fix the error checking to match.
> 
> 

Applied, thanks!

[1/1] soc: qcom: llcc-qcom: Fix NULL vs IS_ERR() bug in qcom_llcc_get_fw_config()
      commit: db0ec1ad723187a3428145b05d4a230d5b6f7e32

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

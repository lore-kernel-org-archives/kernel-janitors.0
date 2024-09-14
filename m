Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3482E1CEAB4
	for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726307857; cv=none; b=o7faHrpLZJuDEnK3YX72LgmFKtpKRZrYiVkJF7wl6ug9x90VnAKmSjE62r92sQZ1ISSmByyMfJFJt6li3btXMiga7l2MRypyaVh00X/+dOebP7CYEh29X0JvaNK7o18DuZCP4OIca5QAitozJOImAR3O5drpXG1WzFhcQhgAmgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726307857; c=relaxed/simple;
	bh=vC+gKpfOvOeBPrlQ1T7rQky/AseG1kthoailPrpBbtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IqmJqUdLKaVxHjR9/40Fwku6EAXkIYOl28jcyoFSa4al7DSQGoVvJbep0i7wVFmoBTEYQh4ZcFXt260K7tKNLczwX9j37t8uOA+Guu+r+jXYHeKw568M8czEmpTGX6zlfZ6Xvprrcc4eeFYu3C3AIPfo5pzdUJ7d1oJ/qZ97Qfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtft83Jm; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtft83Jm"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so250257566b.0
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 02:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726307852; x=1726912652; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KE+o4GW15mD0lO9Q1MSUje0WFegNuMWBNx0d+tJV9y8=;
        b=xtft83Jmdn/3yyvJxRBOhB4jxpUZT/Po/ywj7FZlDNXUnUZgUkMntbiDOwyRTHNyET
         L82hYaMwSrzJnJFtm+0yJVaIMu/8Z68BPTAJKMARZIGnsm9loxfvU9jHBKBfiZsr8UWG
         bV78oxw0CHFA8LbxwMYPkaj25ruvGUhkWsMiEyaMmwqf4YUAQdm0sUUxtbxH/GOIiocx
         /a5CrqJCB0NX4trepv73UGKxJzdb6pgrqPRFwgC01Kh8m25r7sXPL3cbDkBi/CJYMM9p
         vrlnvUoTN4xVPWasqqiqLtjYlxEEpxOurUj3SVZII0F/JTeZaJXICXZRZOn7OWuuIds4
         HpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726307852; x=1726912652;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KE+o4GW15mD0lO9Q1MSUje0WFegNuMWBNx0d+tJV9y8=;
        b=A6GDGjyAbaWxru9lg/X+zQjN6iqSjHyRXPmzfH+Trlcu6BBXklPzmKrCcXipLszAz6
         Qi9T0tOoM1zcZE5K3ng0eW9U6VYIc6Rf7LihD2Q94Ic7qxwaxmOrIFY7F6UvTTbCGP1a
         M966uAI//2qDfato1kFDXw3RzQkSTQZiAUDEq3iGwmbG4ZIzdtqSDWFKmwucCToZQIcY
         DYFnRC8LKxqVJWg2NW7gtETo6o6CeXoo+YbryiejyvUj5x5XhrgVf81tkivAFLGt6kfe
         Y5dbk9SUe17MRyh3jr9gMpI3BLrU1PcantzMyVEQh2bxLiyybF4Fl04TBtiZnwsqG3FM
         JC4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+qqRJxYU4kkL6sOSy6+ojMOsLhFPeTjUkoEmlbrYhEVaXPxLJt99IRvjBSAE+rWUyotKLYCjJq+6qGNLrs/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM5IWCCKtDhZwl5NiFPa7tlfghfAS1Lqd/3qCYWVJ/HrYeWa+q
	82tIy7XMkC35h05IkrTFT2Q9nmq7+epSPqK5Guo5kC7g4eFPswyR+/MqcSlR6T4=
X-Google-Smtp-Source: AGHT+IEQayo62aQvlqZj9eNFA3UtGiSNdY1Nd2T98Zj0wlkmKEFR6sdcxKopa5NxgGNy9WPY2H8KdQ==
X-Received: by 2002:a17:907:608d:b0:a86:79a2:ab15 with SMTP id a640c23a62f3a-a9048102110mr498501066b.40.1726307852548;
        Sat, 14 Sep 2024 02:57:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9061096779sm61360966b.25.2024.09.14.02.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 02:57:32 -0700 (PDT)
Date: Sat, 14 Sep 2024 12:57:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] ice: Fix a couple NULL vs IS_ERR() bugs
Message-ID: <7f7aeb91-8771-47b8-9275-9d9f64f947dd@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ice_repr_create() function returns error pointers.  It never returns
NULL.  Fix the callers to check for IS_ERR().

Fixes: 977514fb0fa8 ("ice: create port representor for SF")
Fixes: 415db8399d06 ("ice: make representor code generic")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/intel/ice/ice_repr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_repr.c b/drivers/net/ethernet/intel/ice/ice_repr.c
index 00d4a9125dfa..970a99a52bf1 100644
--- a/drivers/net/ethernet/intel/ice/ice_repr.c
+++ b/drivers/net/ethernet/intel/ice/ice_repr.c
@@ -452,8 +452,8 @@ struct ice_repr *ice_repr_create_vf(struct ice_vf *vf)
 		return ERR_PTR(-EINVAL);
 
 	repr = ice_repr_create(vsi);
-	if (!repr)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(repr))
+		return repr;
 
 	repr->type = ICE_REPR_TYPE_VF;
 	repr->vf = vf;
@@ -501,8 +501,8 @@ struct ice_repr *ice_repr_create_sf(struct ice_dynamic_port *sf)
 {
 	struct ice_repr *repr = ice_repr_create(sf->vsi);
 
-	if (!repr)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(repr))
+		return repr;
 
 	repr->type = ICE_REPR_TYPE_SF;
 	repr->sf = sf;
-- 
2.45.2


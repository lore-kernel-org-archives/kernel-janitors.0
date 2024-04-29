Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20D9177990
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Apr 2024 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714423538; cv=none; b=hTBQEvmgnT/X4hpsrbuX08yLbFikIbg2Wzs0b95e7PJl6meXbWBOMGNgLauPHhyqIOLbr/Nzi7ABtA6lL0byZKkaflW9DH3LDXm4Lnr0gYlQl45x9+5Pk8lbH6qZ5A+cG65gu2bSCHwfbr+hi2oC9EPnPLiXshkl2z/xQ1rXZEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714423538; c=relaxed/simple;
	bh=swqQysmDwMqqr88s2ywDiAH95K0lzxn5LK729hkN2aw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ckr2JQiC5u+VFk791I1TgQ5hlrs2EkCFDvJVdrV+vPkg8vquBlsDWpU5gg9PZT76UlpYNgVmAfizJBlbEYasu+nBwHTY72xYU00N4u23HFhtqHaAN/60vOsWPVmXQgb+oS8gYKJXZGHmF9iQsNiJEA7yV5J/f1bnscbk6sO0u88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u26yrP+P; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u26yrP+P"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1eb1471c7dbso25015115ad.1
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Apr 2024 13:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714423535; x=1715028335; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x2fmwuVTRYT2T76+zXs3/JLoDv4rTdaNSw/3Jy5CfVQ=;
        b=u26yrP+PtnzcG3AqL3z8fc9NtRzX892JKPMOvCgWvwZ5IQpvlgf1Lc+AsKMVcFd0mS
         p12jdazhmAh0SAyL4nGs9I2DHt5oLXIBbDflElPyHsvTEUkFxD5z9KVjg0ihh4gERNwK
         PUIfcRjHmMTXqvKd2tFG8RsqgKpojZInPgnDBdj01bL6lAj10m7+YHJiJPChznWvsvDt
         GcCoD/mSutsuO98kLsrylKCOESRVM2//IO7X/Q9G4hYzg3Ib/iJrFbMkpMejJ8AR6WLK
         1z99FzK6Nt5J+BBTvPRKJBAGVXeF2cvobMuUryxB3R8CR4KgM1m/uYF3+5y3JKVHgNTp
         u0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714423535; x=1715028335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x2fmwuVTRYT2T76+zXs3/JLoDv4rTdaNSw/3Jy5CfVQ=;
        b=mTmiIYHAmGjZ7nrm5wGPT3ei8GYAHqzN4bKmjRGyTR1c8eBNcfFg+XI2QDTTdas++c
         prmWedgv7DX6a4V8iSf52URW4ls6ycYJej4Sn4Fbj5llld3tJPvjGwnOI64HN72g8xN0
         BS/vfnzDiH2OhniHgYPCOrtwFe536edDVwZDI2dczLP3s13g2kgJXs4dz5PO+1F+WkZ+
         CPJDEst7IPdcW7zrOirtHq6PHqJjToUYdCFf0u0KMfBOJuhM38D0COtAD0YG8TGbSPkn
         5PGJ5AK0AL3mbc7EYKEdZYG5NNR4zsDgsUmzGmZKQAN5SOshvDBPv+63Jkl9+3UG2tCc
         aG9Q==
X-Gm-Message-State: AOJu0YzxaQI8ffBrk48ABPYkvGS3eTuUdvulmKUwIZJ8yhRAx1BprMbz
	T7PypfVR5GjAjn8IhLx8ZCyTKtSqraLwCcghGSEixaR4ce4K0GwqLkGQ9DKcltC9Lh7evB6uORa
	YwA==
X-Google-Smtp-Source: AGHT+IHTxVOr3Y2390m4Vk8ysi9jybVvKP27rvMP+9atp9ocgxWXWjUvkGjNfYfnlwWwa0iT/CXNfGjzEfY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dace:b0:1e5:5c69:fcd7 with SMTP id
 q14-20020a170902dace00b001e55c69fcd7mr2293plx.5.1714423535293; Mon, 29 Apr
 2024 13:45:35 -0700 (PDT)
Date: Mon, 29 Apr 2024 13:45:17 -0700
In-Reply-To: <20240315093629.2431491-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240315093629.2431491-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <171408614081.3338343.3036858355679882617.b4-ty@google.com>
Subject: Re: [PATCH][next] KVM: selftests: Remove second semicolon
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 15 Mar 2024 09:36:29 +0000, Colin Ian King wrote:
> There is a statement with two semicolons. Remove the second one, it
> is redundant.

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Remove second semicolon
      https://github.com/kvm-x86/linux/commit/d85465f2773d

--
https://github.com/kvm-x86/linux/tree/next

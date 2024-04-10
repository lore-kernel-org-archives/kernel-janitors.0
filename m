Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA3028FF
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Apr 2024 00:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712708583; cv=none; b=LCri/3cXVMVGnwb3P4hU1slr7sIYyKAmlAkwqJkc0d4kaew/JtU9tuzjo+zeGB4QDDAimhg7iDElJExOKk7bm6+Fbo4ws6VhJuxV9T2vkL/dA8Q2LnkDZ+9kIidrDOTl7QmOFHMhMdYo6R34KLeK5tOYxPWnd5JrTCfAH9a6h7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712708583; c=relaxed/simple;
	bh=qbAllYoFjx9HxUgTfIOlCWsC0dWo4XP1/Rh0PT3FHPo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FEXOeoAYM3velA+5t+nYra5ltFQko5Qb4x6K4jXhsCLFy2QuoULY2S5OodjEH/JFHYdQ+w3GmXMZclgjvPFfOBJqflQTisD5727gVynF4pBQCfvfwIFsTywLRzk/DHsIIqIfES5H2q+kcpIQ1Yw22G6joZAIFYkz39AOYqbAcwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=waO3yEnq; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="waO3yEnq"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5d8bff2b792so4791607a12.1
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Apr 2024 17:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712708581; x=1713313381; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ODgFnzZURolTJcv5yfCxGgoh6Ey8Xg9T/7xWu6AFDU4=;
        b=waO3yEnqK+TpTUTw5lOYaQBgixdRqcbXYCI/XLqddaHPAOC3dyOYbRW7qZVu9RbYYJ
         SEFh0ENA3e8nlYqOxo4b6ut+43yTTjFFEAUz6QA63fY3tOe1UtoONeGdJBqHl/8oaFW4
         JmAorr1SjatgSnSfUGohHaP2ACdtBNJ5ce1+J9qeGEpxTp497lG0B9vhYTolGrKBG2/b
         J3ZtbTothoNvEjwHjg+czf47rI81+v7Jb3xJaLrdHbbnlupbS8YWDiUEE0nveGupl/4b
         DWq4tVIHEIHaUeKIg+JkVY8q+HWeADk2taWGJnIejx8xGzkq9SUwDqJYZ3GYXvyNVKhn
         dyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712708581; x=1713313381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODgFnzZURolTJcv5yfCxGgoh6Ey8Xg9T/7xWu6AFDU4=;
        b=sPRiZacI7CSS+U6qAwd7mboIru7WevtgazbAcluf6wqt8fJzXxEJT6+xdSr5TFivWN
         xhIYrN+PFyNaWsIQIkYGaNE2oqELSXUxzCFcZu+O0uU1faiQ/RMhR8C3jnhceQ5n1sQx
         DMXAn+/FAPurd1pOlaKAzhkX+p144Nmm9nf8l8lYol/GdBXF7dTlhuc7KHNYGRvfo+eO
         axLqNP8exAblN+kjpsKx/3D6LRxHoJuIpZ9xCprTDsjhz0on4UTSv45vRXTpbizxfZu6
         L3mEDumQTRAFsnCShwpe290qeHHwUjzlsHiO0Uy2EQkTOeaOSuCQ4vKwn3CLk7ALIQoe
         pPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+BQZ6t8qBuHEQebL3hIfrHfLJHyeEixBgYwEhKQkUcBklQSYhEDxPfAm2nV6/zqw0qgK+BTLthqmiLmqfGmQkn/8H7U1wwxmb3PUHhs3y
X-Gm-Message-State: AOJu0YweMO8+TFoBq6uDqx/BD9TBEI97pboCY+Y0E8YoLqsjtsbLSDKL
	KybNnqyp7YDl2NymxluHgQNAETK8vWTJ6j46cY2VcuxRNxoFSA4s/qAo2ou8QhY3wlR1xL0z6zU
	i/A==
X-Google-Smtp-Source: AGHT+IFxZ4YIeHwrsOIP8qB4kNY13/pCHAeW1+dcdPCjqmbXj6Q6la1p/S+Rr6uQ7F+iCZNNDwqyU2Eqsac=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:4e54:0:b0:5dc:1b02:5a56 with SMTP id
 o20-20020a634e54000000b005dc1b025a56mr3245pgl.1.1712708581274; Tue, 09 Apr
 2024 17:23:01 -0700 (PDT)
Date: Tue,  9 Apr 2024 17:19:57 -0700
In-Reply-To: <c7619a3d3cbb36463531a7c73ccbde9db587986c.1710004509.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <c7619a3d3cbb36463531a7c73ccbde9db587986c.1710004509.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <171270501999.1589908.16513783638221600780.b4-ty@google.com>
Subject: Re: [PATCH] KVM: SVM: Remove a useless zeroing of allocated memory
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, 09 Mar 2024 18:15:45 +0100, Christophe JAILLET wrote:
> Depending of the memory size needed, we clear or not the allocated memory.
> This is not consistent.
> 
> So remove the zeroing of the memory in the __vmalloc() case.

Applied to kvm-x86 svm, with a massaged changelog to unequivocally state that
not zeroing the memory is a-ok.  Thanks!

[1/1] KVM: SVM: Remove a useless zeroing of allocated memory
      https://github.com/kvm-x86/linux/commit/4710e4fc3e2a

--
https://github.com/kvm-x86/linux/tree/next

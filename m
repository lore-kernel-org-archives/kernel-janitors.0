Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338EB3232
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Feb 2025 16:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685762; cv=none; b=jcww0clmaQF0q3ln+7depxPuHlArt/9ayGVMBe7d++ovpse9zMLJIsD5ok5nJm8boztoQ4nyBMjOBCeiqT+LQBLsNQ+uvYbPdYoWUUPb4KxRg3ZpEr0AIIQ7CIDnyrF0WrdIpZf50E+rRJ786OTmA8vFvsxYRIg3GxlXcBAyX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685762; c=relaxed/simple;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzj6UzONKT+OZGKaVdt6eSjEEedgG1D/el7u/IPKiZ/PZ/2mxqOj9lDfPgTttIoGWNV9ZpLd3pM1wIyYicKR5MOaVHkuVdmXy4D87s+XN/0RzpZW3ngdvxNdCQBZchvx2aJ0EchQSGGj5EwYFOIPYzXvtLIULsA8qUioLm/e000=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQPxi4UG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQPxi4UG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738685760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=dQPxi4UGj4Sfj5tTTqMttbT1KrZ9c0MJeKDUAa/5+LgOLuHRtrfz0GXtoyMNiZ2sBPuh8i
	shgcIWeOyK3Faadg83gSfy4Xyi4BwfABgtMViA9jby0NIDqtRDqex6SuTYf4PLop9/Zgs4
	dKkkCZWBios1u4Zeggc6ruRJBZ/hpwo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-NefMONUHNcaM9JCWy--Unw-1; Tue,
 04 Feb 2025 11:15:58 -0500
X-MC-Unique: NefMONUHNcaM9JCWy--Unw-1
X-Mimecast-MFC-AGG-ID: NefMONUHNcaM9JCWy--Unw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E25019560A1;
	Tue,  4 Feb 2025 16:15:57 +0000 (UTC)
Received: from virtlab1023.lab.eng.rdu2.redhat.com (virtlab1023.lab.eng.rdu2.redhat.com [10.8.1.187])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5FECE3003E7F;
	Tue,  4 Feb 2025 16:15:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: Fix spelling mistake "initally" -> "initially"
Date: Tue,  4 Feb 2025 11:15:53 -0500
Message-ID: <20250204161553.252280-1-pbonzini@redhat.com>
In-Reply-To: <20250204105647.367743-1-colin.i.king@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Queued, thanks.

Paolo



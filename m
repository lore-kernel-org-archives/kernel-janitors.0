Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1335965
	for <kernel-janitors@vger.kernel.org>; Mon, 25 Aug 2025 21:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756158609; cv=none; b=amAPCjVlADEMMIy917/3btsonGxj0ihJzut9KSagTCWhBKyIVLZJS3PnnIgq63DPG4ynvQ0Vq/EJVx6boqwOp7K0GPJOipmgWO5h8cYyK033dO3g9ThVoi5a9BcZW6hH0sJaVkI+Ra8iurxrXbXWt6O0dlTr2DB0rUtuAv8+fiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756158609; c=relaxed/simple;
	bh=hWJIO2sws/xStZhhfgrVZZx6ZEda2KaT4k2a8/ohfp8=;
	h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type; b=NAvtDZ0OJtV5Z2uBVxllxrjh2e+jFQJ3M824F1ju7a1zC2UQP865zr7djWDtZcWkL0rHFZ4GOkPczr6Qwonxyowtavs6Expg2K0Uvbmwa2lnMvcPc+RIfQYaZft+XWVg5lUI60bpvlOPxpgE1k5JxZZTUQhRFl4Pygz4SflsfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net; spf=pass smtp.mailfrom=msa.hinet.net; dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b=bWU/M5+K; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=msa.hinet.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b="bWU/M5+K"
Received: from cmsr6.hinet.net ([10.199.216.85])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 57PLo3Y3594701
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <kernel-janitors@vger.kernel.org>; Tue, 26 Aug 2025 05:50:03 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=msa.hinet.net;
	s=default; t=1756158603; bh=q2zIQ6Xs/MiAhflU3xx/I4yghck=;
	h=From:To:Subject:Date;
	b=bWU/M5+K5uuS9g2vKP+kQy/YqhTFp+1sF41o61CATLqRf9BEgfcr/uXPduqdBJ6HK
	 kV4BY34AgFTzjz1xMbgjxYsqcs6Lc97cXeCF3ke+A6rUd7LZeyM8xNDsVJyc0rdBs6
	 fJA3VpnwUhZstxBOqgPdCiwIsQvAb01QGLpjpY6I=
Received: from [127.0.0.1] (1-175-209-235.dynamic-ip.hinet.net [1.175.209.235])
	by cmsr6.hinet.net (8.15.2/8.15.2) with ESMTPS id 57PLmE2A872092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <kernel-janitors@vger.kernel.org>; Tue, 26 Aug 2025 05:48:17 +0800
Message-ID: <26e50f712378131c29673d14f78b2c7e3953b6029a3c488eb2499ea14385b332@msa.hinet.net>
From: Procurement <europe-salesbond@msa.hinet.net>
Reply-To: europe-sales@albinayah-group.com
To: kernel-janitors@vger.kernel.org
Subject: September Order - RFQ
Date: Mon, 25 Aug 2025 14:48:17 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=YdAe5BRf c=1 sm=1 tr=0 ts=68acda22
	a=eAu0OzOkLfYPV0Yl8zEnCA==:117 a=kj9zAlcOel0A:10 a=woOiZ7w2AAAA:8
	a=Gp9z5yGasSGPIeDKQg4A:9 a=CjuIK1q_8ugA:10 a=y8FzcybzHWbWVUxH3U7b:22

Hi,

Please kindly quote best price for your following products:

Include:
1.Price
2.Delivery term
3.Quote expiry : September

Thanks!

Kamal Prasad

Manager

Albinayah.com

Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D33735F5E9
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 06:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692206; cv=none; b=XC5gPGTm6YZIF45wDARjH19DiFxIgF+yEEzc5kDXpVpt9joNODj74mxuIZxpEyTWRGdc5sPJLbepsFzgljpnmD12suCIAbVjfNCiIq0/yMc8ApoSnu2i+/rVe0OfYZf7gQEAiU9D//oR2aiIaGJ01s5JooFguhmU09LQBxnvS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692206; c=relaxed/simple;
	bh=jDVOMYhYewn6ATtZbKp3VJy/YN+xTXplywg9VZlCfOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JyQEein+fOYYccOcKueOBC+2aQxFLtsP6P6sKt9MYbk/3R7cbJiBjjA90mKLXIJUnWW9cMfMFctcRZe8NqD+sc6yiT/gcREfhP90cAhKqHvvFjI8qANjl0GyJbU8wxKd4rgS6YoZFQYqNo5dT8zmDWz+aiEJZKLJJztXkpsBoSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gxscjd6x; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gxscjd6x"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fe608cb92so5558560f8f.2
        for <kernel-janitors@vger.kernel.org>; Sun, 24 May 2026 23:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779692200; x=1780297000; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GW1L+sX0aQAPGDZcLmvDCGiKclqdN5QY1XJTp1+tXFo=;
        b=Gxscjd6x0aoKCADdgTqMaBa/5VQ/n4Ru5Ap84EhCmT6zDhO79/Pecodw3cfEpvvJlH
         8Bb/fCyxbJYuRaZbIZzhLdxNQbvwR0YLy0DdXrgUwSzMP5jo1Vl8dd5NsVUolf73usi8
         oKXW9PUBFyb+kt4/zlVQ/RLFR3Ie7pCN1sSzK0WTPeufj7+GQEPW+UWXp4cikoUIFw9N
         Q8O7giN6AKQISk0k/B1AZXxDWMbTtmqTVCDz+Zh0MhnqlNmvBiZUkQD9wG4s1nlwuE1j
         Eb+ChdSCebUTVSujtZ98K2mQhTnjYg4sjxPOg/3pqpq2NCRuLrx6fDPAZYFSdwt6Rs4U
         uIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692200; x=1780297000;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW1L+sX0aQAPGDZcLmvDCGiKclqdN5QY1XJTp1+tXFo=;
        b=Bt7KDxOT12364zr2ldTwmKWkX98JqQN6GUeeJw8+E8WgDAfcJf7/HiPSNMx5pKvRLN
         wrQzmVbSQITHbk9796QiH18wSB+gxWLSJ1ZONyajRjz9vdBZOdGFvfZQ1buArtdK8IEo
         QFWymOrrg8cxteoSxOowXejxZa1whxl6AVMFyrXoazCWYTqHgZUMxMqSkfGngiqxD4XA
         jUGT5xroqwg4nPt+nlB/F1x+l4vCpiTggt6bjPiR6OpjZ8mF+ZEtoBA0FiprC0LXIo53
         L5CRSKw6bCR8zeDxpkecxanrAgUWTy1UdVFr7ULj6fhVN9iO/GXtc4FZS/F++Yt4DMKP
         hylw==
X-Forwarded-Encrypted: i=1; AFNElJ+fADfeouT2yEtAedSBkefKQ+lIuYjUZVc+1WhnUJugLd/GFpeJyOZOPOOqlQ8EhHtAMbNeAUsoCCy9JT3v+VA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLU/k4rTKfyV7V4Iwpd5nMMUJayiTo/gaGpz450kXKKC9Uy6RU
	806Lqjz1hKjni0nsDHAs9P0c6kes/F21wawgEOVISgi4mBXErIRN4G33
X-Gm-Gg: Acq92OGkT7I3WDQKiJ8b0HN0wkyTnBhrmbJwirv1OWvnuPaIjEfwlUcJTujCO0WgCe3
	vdVPnClmAnHAPzM18Qizp1sais5vEle+Arn/fdw9T3FkxsEmhCfKcmnBV78E0Lm2NTqYj5uVNnb
	VYZ+lbbqiuIicG6REqCkdAqzmiDpeA1MQd2kVta+fRydevgMsjq/ii7sAaQ7XHBtOVZD6WaPNH/
	D/w5IbugVyPjjfWtUuLRP+eBiaVCgtdFKYPXuWuuPlNtUqP8DpM1odMJo/yRMj9JN4sUUTaigum
	BplqGerwOVdPAeEFmeROozz4+kROWUk8kP2Q2CgL9JEUczkagJ1kPeXDpaCnHDi+evqvyRlOD/5
	Y2OkMFTnwXK7Ar1TMSBT8ViLA2AG4ufdG7igHVPxyG1awBIS/MNS6l/vjWgbFQCVvg4r4rjovbE
	CQYW4rqJBgx04y21vPTi1GEWmdD0j4Fk85eA==
X-Received: by 2002:a5d:588d:0:b0:455:7c9f:a49e with SMTP id ffacd0b85a97d-45eb38c5508mr24586775f8f.25.1779692200400;
        Sun, 24 May 2026 23:56:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5c32esm23804272f8f.26.2026.05.24.23.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:56:39 -0700 (PDT)
Date: Mon, 25 May 2026 09:56:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes.berg@intel.com>,
	Stefan Kerkmann <s.kerkmann@pengutronix.de>,
	Kees Cook <kees@kernel.org>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: mwifiex: remove an unnecessary check
Message-ID: <ahPypOdz-KXh5KAJ@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We know that "start_raw" is true so remove this check and pull the code
in an tab.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 .../net/wireless/marvell/mwifiex/sta_cmd.c    | 35 ++++++++-----------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
index 70ce31d7c76e..623ddde8c8e5 100644
--- a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
+++ b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
@@ -1568,28 +1568,23 @@ int mwifiex_send_rgpower_table(struct mwifiex_private *priv, const u8 *data,
 			return -EINVAL;
 		}
 
-		if (start_raw) {
-			while ((*pos != '\r' && *pos != '\n') &&
-			       (token = strsep((char **)&pos, " "))) {
-				if (ptr - hostcmd->cmd >=
-				    MWIFIEX_SIZE_OF_CMD_BUFFER) {
-					mwifiex_dbg(
-						adapter, ERROR,
-						"%s: hostcmd is larger than %d, aborting\n",
-						__func__, MWIFIEX_SIZE_OF_CMD_BUFFER);
-					return -ENOMEM;
-				}
+		while ((*pos != '\r' && *pos != '\n') &&
+		       (token = strsep((char **)&pos, " "))) {
+			if (ptr - hostcmd->cmd >= MWIFIEX_SIZE_OF_CMD_BUFFER) {
+				mwifiex_dbg(adapter, ERROR,
+					"%s: hostcmd is larger than %d, aborting\n",
+					__func__, MWIFIEX_SIZE_OF_CMD_BUFFER);
+				return -ENOMEM;
+			}
 
-				ret = kstrtou8(token, 16, ptr);
-				if (ret < 0) {
-					mwifiex_dbg(
-						adapter, ERROR,
-						"%s: failed to parse hostcmd %d token: %s\n",
-						__func__, ret, token);
-					return ret;
-				}
-				ptr++;
+			ret = kstrtou8(token, 16, ptr);
+			if (ret < 0) {
+				mwifiex_dbg(adapter, ERROR,
+					"%s: failed to parse hostcmd %d token: %s\n",
+					__func__, ret, token);
+				return ret;
 			}
+			ptr++;
 		}
 	}
 
-- 
2.53.0


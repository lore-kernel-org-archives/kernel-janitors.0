From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Thu, 18 Oct 2012 09:23:19 +0000
Subject: [regulator:topic/max77686 1/2] drivers/regulator/max77686.c:73:5: sparse: symbol 'max77686_enable' w
Message-Id: <20121018092319.GN21995@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Yadwinder,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git topic/max77686
head:   15282ba9ea9d22c437dd53e589b937207b6a38ce
commit: 6d2c896b72322ccca465b57123e66890ebddb0ab [1/2] regulator: max77686: Use already set opmode while re-enabling regulators.

+ drivers/regulator/max77686.c:73:5: sparse: symbol 'max77686_enable' was not declared. Should it be static?

vim +73 drivers/regulator/max77686.c

133d4016 Jonghwa Lee          2012-06-01  57  
133d4016 Jonghwa Lee          2012-06-01  58  #define MAX77686_REGULATORS	MAX77686_REG_MAX
133d4016 Jonghwa Lee          2012-06-01  59  #define MAX77686_LDOS		26
133d4016 Jonghwa Lee          2012-06-01  60  
133d4016 Jonghwa Lee          2012-06-01  61  enum max77686_ramp_rate {
133d4016 Jonghwa Lee          2012-06-01  62  	RAMP_RATE_13P75MV,
133d4016 Jonghwa Lee          2012-06-01  63  	RAMP_RATE_27P5MV,
133d4016 Jonghwa Lee          2012-06-01  64  	RAMP_RATE_55MV,
133d4016 Jonghwa Lee          2012-06-01  65  	RAMP_RATE_NO_CTRL,	/* 100mV/us */
133d4016 Jonghwa Lee          2012-06-01  66  };
133d4016 Jonghwa Lee          2012-06-01  67  
133d4016 Jonghwa Lee          2012-06-01  68  struct max77686_data {
cb44cdea Axel Lin             2012-08-05  69  	struct regulator_dev *rdev[MAX77686_REGULATORS];
6d2c896b Yadwinder Singh Brar 2012-10-16  70  	unsigned int opmode[MAX77686_REGULATORS];
133d4016 Jonghwa Lee          2012-06-01  71  };
133d4016 Jonghwa Lee          2012-06-01  72  
6d2c896b Yadwinder Singh Brar 2012-10-16 @73  int max77686_enable(struct regulator_dev *rdev)
6d2c896b Yadwinder Singh Brar 2012-10-16  74  {
6d2c896b Yadwinder Singh Brar 2012-10-16  75  	struct max77686_data *max77686 = rdev_get_drvdata(rdev);
6d2c896b Yadwinder Singh Brar 2012-10-16  76  
6d2c896b Yadwinder Singh Brar 2012-10-16  77  	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
6d2c896b Yadwinder Singh Brar 2012-10-16  78  				  rdev->desc->enable_mask,
6d2c896b Yadwinder Singh Brar 2012-10-16  79  				  max77686->opmode[rdev->desc->id]);
6d2c896b Yadwinder Singh Brar 2012-10-16  80  }
6d2c896b Yadwinder Singh Brar 2012-10-16  81  

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

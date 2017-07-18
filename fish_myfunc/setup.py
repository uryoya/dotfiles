from setuptools import setup, find_packages

setup(name='myfunc',
      version='0.0.1',
      description='fishの自作関数をテキトーに管理する',
      auther='URANO Ryoya',
      auther_email='uryoya.ur@gmail.com',
      url='uryoya.github.io',
      entry_points="""
      [console_scripts]
      dotmanage = myfunc.myfunc:main
      """,)

# language-extensions
A set of new language features for Pharo 9.0-10

```Smalltalk
Metacello new
    baseline: 'LanguageExtensions';
    repository: 'github://maxwills/language-extensions:main';
    load.
```

If you manually load the package (Without using the baseline), the you will need to install the extensions executing:

```Smalltalk
LanguageExtensions installLanguageExtensions
```

It will override some methods that will allow the AutoProperty traits to work.

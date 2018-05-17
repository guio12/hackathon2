<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PlayedMap
 *
 * @ORM\Table(name="played_map")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\PlayedMapRepository")
 */
class PlayedMap
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Map")
     * @ORM\JoinColumn(nullable=false)
     */
    private $map;

    /**
     * @var int
     *
     * @ORM\Column(name="score1", type="integer")
     */
    private $score1;

    /**
     * @var int
     *
     * @ORM\Column(name="score2", type="integer")
     */
    private $score2;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\OW_Match")
     * @ORM\JoinColumn(nullable=false)
     */
    private $owMatch;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set map
     *
     * @param integer $map
     *
     * @return PlayedMap
     */
    public function setMap($map)
    {
        $this->map = $map;

        return $this;
    }

    /**
     * Get map
     *
     * @return int
     */
    public function getMap()
    {
        return $this->map;
    }

    /**
     * Set score1
     *
     * @param integer $score1
     *
     * @return PlayedMap
     */
    public function setScore1($score1)
    {
        $this->score1 = $score1;

        return $this;
    }

    /**
     * Get score1
     *
     * @return int
     */
    public function getScore1()
    {
        return $this->score1;
    }

    /**
     * Set score2
     *
     * @param integer $score2
     *
     * @return PlayedMap
     */
    public function setScore2($score2)
    {
        $this->score2 = $score2;

        return $this;
    }

    /**
     * Get score2
     *
     * @return int
     */
    public function getScore2()
    {
        return $this->score2;
    }

    /**
     * Set owMatch
     *
     * @param integer $owMatch
     *
     * @return PlayedMap
     */
    public function setOwMatch($owMatch)
    {
        $this->owMatch = $owMatch;

        return $this;
    }

    /**
     * Get owMatch
     *
     * @return int
     */
    public function getOwMatch()
    {
        return $this->owMatch;
    }
}

